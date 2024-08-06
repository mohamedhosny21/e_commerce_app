import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../../../business_logic_layer/payment_cubit/payment_cubit.dart';
import '../../../core/routing/routes.dart';
import '../../../core/constants/styles.dart';
import '../../../helpers/circular_progress_indicator.dart';
import '../../../helpers/snackbar.dart';

typedef GetIndexAndSelectedToggleButton = Function(
    int index, List<bool> selectedToggleButton);

class RegisterBlocListener extends StatefulWidget {
  final String email;
  final String password;
  final Widget child;
  final int index;
  final List<bool> selectedToggleButton;
  final GetIndexAndSelectedToggleButton getIndexAndSelectedToggleButton;
  const RegisterBlocListener(
      {super.key,
      required this.email,
      required this.password,
      required this.getIndexAndSelectedToggleButton,
      required this.child,
      required this.index,
      required this.selectedToggleButton});

  @override
  State<RegisterBlocListener> createState() => _RegisterBlocListenerState();
}

class _RegisterBlocListenerState extends State<RegisterBlocListener> {
  late int index;
  late List<bool> selectedToggleButton;
  @override
  void initState() {
    super.initState();
    index = widget.index;
    selectedToggleButton = widget.selectedToggleButton;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoadingState) {
          showCircularProgressIndicator(context);
        } else if (state is OnCreateAccountFailedState) {
          Navigator.pop(context);
          showErrorSnackBar(context, state.errorMsg);
        } else if (state is OnCreateAccountSuccessState) {
          context.read<PaymentCubit>().createStripeCustomer();
          Navigator.pop(context);
          showSuccessSnackBar(context, state.successMsg);
          Timer(const Duration(seconds: 1), () {
            AwesomeDialog(
              descTextStyle: MyTextStyles.font20BlackRegular,
              context: context,
              onDismissCallback: (type) {
                setState(() {
                  index = 1;
                  selectedToggleButton = [false, true];
                  widget.getIndexAndSelectedToggleButton(
                      index, selectedToggleButton);
                });
              },
              desc:
                  '${context.tr('Email_has_been_sent_to')} ${widget.email} ${context.tr('Check_your_inbox_to_verify_your_email')}',
              dialogType: DialogType.info,
              btnOkOnPress: () {
                index = 1;
                selectedToggleButton = [false, true];
                widget.getIndexAndSelectedToggleButton(
                    index, selectedToggleButton);
              },
            ).show();
          });
        } else if (state is OnLoginSuccessState) {
          Navigator.pop(context);
          showSuccessSnackBar(context, state.successMsg);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false);
        } else if (state is LoginWithSocialSuccessState) {
          if (state.isNewUser) {
            context.read<PaymentCubit>().createStripeCustomer();
          }
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false);
        } else if (state is OnLoginFailedState) {
          Navigator.pop(context);
          showErrorSnackBar(context, state.errorMsg);

          Timer(const Duration(seconds: 1), () {
            if (state.errorMsg == 'Email-Not-Verified') {
              AwesomeDialog(
                context: context,
                btnOkText: context.tr('Resend'),
                desc: context.tr('Your_email_is_not_verified_yet'),
                dialogType: DialogType.warning,
                title: context.tr('Email_Verification'),
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  BlocProvider.of<AuthCubit>(context)
                      .resendEmailVerification(widget.email, widget.password);
                },
              ).show();
            }
          });
        } else if (state is OnEmailVerificationSentSuccessState) {
          Navigator.pop(context);
          showSuccessSnackBar(context, state.successMsg);
        } else if (state is OnEmailVerificationSentFailedState) {
          Navigator.pop(context);
          showErrorSnackBar(context, state.errorMsg);
        } else if (state is OnResetPasswordSuccessState) {
          Navigator.pop(context);
          showSuccessSnackBar(context, state.successMsg);
        } else if (state is OnResetPasswordFailedState) {
          Navigator.pop(context);
          showErrorSnackBar(context, state.errorMsg);
        }
      },
      child: widget.child,
    );
  }
}
