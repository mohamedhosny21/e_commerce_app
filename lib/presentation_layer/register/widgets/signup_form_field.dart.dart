import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/presentation_layer/widgets/textformfield_widgets.dart';
import '../../../business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import '../../../constants/dimensions.dart';
import 'register_button.dart';

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
            buttonText: 'Sign Up',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                BlocProvider.of<AuthenticationCubit>(context).createUserAccount(
                    email: email, password: password, userName: userName);
              }
            },
          ),
        ],
      ),
    );
  }
}
