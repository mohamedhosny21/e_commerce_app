import 'package:flutter/material.dart';
import '../../core/widgets/toggle_button.dart';
import 'widgets/register_listener_widget.dart';
import 'widgets/signup_form_field.dart.dart';
import 'widgets/signin_form_field.dart';

import '../../core/constants/dimensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email = '';
  late String password = '';
  List<bool> selectedToggleButton = [false, true];
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          child: SingleChildScrollView(
              child: RegisterBlocListener(
            email: email,
            password: password,
            index: index,
            selectedToggleButton: selectedToggleButton,
            getIndexAndSelectedToggleButton: (index, selectedToggleButton) {
              setState(() {
                this.index = index;
                this.selectedToggleButton = selectedToggleButton;
              });
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppDimensions.verticalSpacing30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyToggleButton(
                    selectedToggleButton: selectedToggleButton,
                    getToggleButtonIndex: (toggleButtonIndex) {
                      setState(() {
                        index = toggleButtonIndex;
                      });
                    },
                  )
                ],
              ),
              AppDimensions.verticalSpacing60,
              if (index == 0)
                SignUpFormWidget(
                  getEmail: (email) {
                    setState(() {
                      this.email = email;
                    });
                  },
                )
              else if (index == 1)
                SignInFormWidget(
                  getEmail: (email) {
                    setState(() {
                      this.email = email;
                    });
                  },
                  getPassword: (password) {
                    setState(() {
                      this.password = password;
                    });
                  },
                ),
            ]),
          )),
        ),
      ),
    );
  }
}
