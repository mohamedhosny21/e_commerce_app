import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import 'reset_password_form_field.dart';

import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';

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
                context.tr('Enter_Your_Email_To_Reset_Password'),
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
              BlocProvider.of<AuthCubit>(context)
                  .resetPassword(resetPasswordEmail);
            }
          },
        ).show();
      },
      child: Text(
        context.tr('Forgot_Password'),
        style: MyTextStyles.font14NavyBlueRegular,
      ),
    );
  }
}
