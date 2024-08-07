import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../../../core/constants/dimensions.dart';
import 'confirm_password_text_form_field.dart';
import 'email_text_form_field.dart';
import 'password_text_form_field.dart';
import 'register_button.dart';
import 'username_text_form_field.dart';

class SignUpFormWidget extends StatefulWidget {
  final GetEmail getEmail;

  const SignUpFormWidget({
    super.key,
    required this.getEmail,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  late String email;

  late String password;

  late String userName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UserNameTextFormField(
            getUserName: (userName) {
              this.userName = userName;
            },
          ),
          AppDimensions.verticalSpacing10,
          EmailTextFormField(
            getEmail: (email) {
              this.email = email;
              widget.getEmail(this.email);
            },
          ),
          AppDimensions.verticalSpacing10,
          PasswordTextFormField(
            passwordController: _passwordController,
            getPassowrd: (password) {
              this.password = password;
            },
          ),
          AppDimensions.verticalSpacing10,
          ConfirmPasswordTextFormField(passwordController: _passwordController),
          AppDimensions.verticalSpacing30,
          RegisterButton(
            buttonText: context.tr('Sign_Up'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<AuthCubit>().createUserAccount(
                    email: email, password: password, userName: userName);
              }
            },
          ),
        ],
      ),
    );
  }
}
