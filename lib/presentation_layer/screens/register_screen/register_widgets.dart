import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/presentation_layer/widgets/textformfield_widgets.dart';

import '../../../business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import '../../../constants/dimensions.dart';

import '../../widgets/buttons.dart';

typedef GetEmail = Function(String email);
typedef GetPassword = Function(String password);

// ignore: must_be_immutable
class SignInFormWidget extends StatelessWidget {
  final GetEmail getEmail;
  final GetPassword getPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String resetPasswordEmail;
  late String password;

  SignInFormWidget({
    super.key,
    required this.getEmail,
    required this.getPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextFormField(
            getEmail: (email) {
              this.email = email;
              getEmail(this.email);
            },
          ),
          AppDimensions.verticalSpacing10,
          PasswordTextFormField(
            passwordController: _passwordController,
            getPassowrd: (password) {
              this.password = password;
              getPassword(this.password);
            },
          ),
          TextButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                body: Column(
                  children: [
                    Text(
                      'Enter Your Email To Reset Password',
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
                  if (ResetPasswordFormWidget.formKey.currentState!
                      .validate()) {
                    ResetPasswordFormWidget.formKey.currentState!.save();
                    BlocProvider.of<AuthenticationCubit>(context)
                        .resetPassword(resetPasswordEmail);
                  }
                },
              ).show();
            },
            child: Text(
              'Forgot Password ?',
              style: MyTextStyles.font14NavyBlueRegular,
            ),
          ),
          AppDimensions.verticalSpacing5,
          RegisterButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                BlocProvider.of<AuthenticationCubit>(context)
                    .signInWithEmailAndPassword(
                        email: email, password: password);
              }
            },
            buttonText: 'Login',
          ),
          AppDimensions.verticalSpacing20,
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: AppDimensions.marginStart20End10,
                  height: 2,
                  color: MyColors.navyBlue,
                ),
              ),
              Text(
                'Or',
                style: MyTextStyles.font18NavyBlueBold,
              ),
              Expanded(
                child: Container(
                  margin: AppDimensions.marginStart10End20,
                  height: 2,
                  color: MyColors.navyBlue,
                ),
              ),
            ],
          ),
          AppDimensions.verticalSpacing15,
          SocialRegisterButton(
            iconColor: Colors.red,
            buttonText: 'Sign In With Google',
            buttonColor: Colors.white,
            buttonIcon: FontAwesomeIcons.googlePlusG,
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).signInWithGoogle();
            },
          ),
          AppDimensions.verticalSpacing10,
          SocialRegisterButton(
            iconColor: const Color.fromARGB(255, 12, 46, 183),
            buttonText: 'Sign In With Facebook',
            buttonColor: Colors.white,
            buttonIcon: FontAwesomeIcons.facebook,
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context)
                  .signInWithFacebook();
            },
          ),
          AppDimensions.verticalSpacing10,
          SocialRegisterButton(
            iconColor: Colors.grey,
            buttonText: 'Sign In With X ',
            buttonColor: Colors.white,
            buttonIcon: FontAwesomeIcons.xTwitter,
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).signInWithTwitter();
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SignUpFormWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GetEmail getEmail;
  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String password;
  late String userName;
  SignUpFormWidget({
    super.key,
    required this.getEmail,
  });

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
              getEmail(this.email);
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

// ignore: must_be_immutable
class ResetPasswordFormWidget extends StatelessWidget {
  late String email;
  final GetEmail getEmail;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ResetPasswordFormWidget({super.key, required this.getEmail});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: EmailTextFormField(
          getEmail: (email) {
            this.email = email;
            getEmail(this.email);
          },
        ));
  }
}
