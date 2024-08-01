import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/register/widgets/reset_password_form_field.dart';

import '../../../business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/styles.dart';

class ForgotPasswordButton extends StatefulWidget {
  const ForgotPasswordButton({super.key});

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  late String resetPasswordEmail;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AwesomeDialog(
          context: context,
          body: Column(
            children: [
              Text(
                S.of(context).Enter_Your_Email_To_Reset_Password,
                style: MyTextStyles.font14BlackRegular,
              ),
              AppDimensions.verticalSpacing15,
              ResetPasswordFormWidget(
                getEmail: (email) {
                  resetPasswordEmail = email;
                },
              ),
            ],
          ),
          btnCancelOnPress: () {},
          showCloseIcon: true,
          btnOkOnPress: () {
            if (ResetPasswordFormWidget.formKey.currentState!.validate()) {
              ResetPasswordFormWidget.formKey.currentState!.save();
              BlocProvider.of<AuthenticationCubit>(context)
                  .resetPassword(resetPasswordEmail);
            }
          },
        ).show();
      },
      child: Text(
        S.of(context).Forgot_Password,
        style: MyTextStyles.font14NavyBlueRegular,
      ),
    );
  }
}
