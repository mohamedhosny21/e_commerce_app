import 'package:flutter/material.dart';

import '../../../widgets/textformfield_widgets.dart';

typedef GetEmail = Function(String email);

class ResetPasswordFormWidget extends StatefulWidget {
  final GetEmail getEmail;
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  const ResetPasswordFormWidget({super.key, required this.getEmail});

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: ResetPasswordFormWidget.formKey,
        child: EmailTextFormField(
          getEmail: (email) {
            this.email = email;
            widget.getEmail(this.email);
          },
        ));
  }
}
