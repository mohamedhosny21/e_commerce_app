import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/register/widgets/divider.dart';
import 'package:home_slice/presentation_layer/register/widgets/forgot_password_button.dart';

import '../../../business_logic_layer/cubit/authentication_cubit/cubit/authentication_cubit.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/styles.dart';
import '../../../widgets/textformfield_widgets.dart';
import 'register_button.dart';
import 'social_register_button.dart';

typedef GetEmail = Function(String email);
typedef GetPassword = Function(String password);

class SignInFormWidget extends StatefulWidget {
  final GetEmail getEmail;
  final GetPassword getPassword;

  const SignInFormWidget({
    super.key,
    required this.getEmail,
    required this.getPassword,
  });

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
              widget.getPassword(this.password);
            },
          ),
          const ForgotPasswordButton(),
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
            buttonText: S.of(context).Login,
          ),
          AppDimensions.verticalSpacing20,
          Row(
            children: [
              DividerWidget(margin: AppDimensions.marginStart20End10),
              Text(
                S.of(context).Or,
                style: MyTextStyles.font18NavyBlueBold,
              ),
              DividerWidget(margin: AppDimensions.marginStart10End20),
            ],
          ),
          AppDimensions.verticalSpacing15,
          SocialRegisterButton(
            iconColor: Colors.red,
            buttonText: S.of(context).Sign_In_With_Google,
            buttonColor: Colors.white,
            buttonIcon: FontAwesomeIcons.googlePlusG,
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).signInWithGoogle();
            },
          ),
          AppDimensions.verticalSpacing10,
          SocialRegisterButton(
            iconColor: const Color.fromARGB(255, 12, 46, 183),
            buttonText: S.of(context).Sign_In_With_Facebook,
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
            buttonText: S.of(context).Sign_In_With_X,
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
