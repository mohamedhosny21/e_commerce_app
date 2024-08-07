import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widgets/textformfield_widgets.dart';

class ConfirmPasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;
  const ConfirmPasswordTextFormField(
      {super.key, required this.passwordController});

  @override
  State<ConfirmPasswordTextFormField> createState() =>
      _ConfirmPasswordTextFormFieldState();
}

class _ConfirmPasswordTextFormFieldState
    extends State<ConfirmPasswordTextFormField> {
  bool isVisible = false;
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
        obscureText: isVisible ? false : true,
        suffixIcon: isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        suffixOnPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        autovalidateMode: AutovalidateMode.always,
        validator: (inputValue) {
          if (inputValue!.isEmpty || inputValue.length < 8) {
            return context.tr('must_be_at_least_8_characters');
          } else if (widget.passwordController.text !=
              _confirmPasswordController.text) {
            return context.tr('Password_not_match');
          }
          return null;
        },
        controller: _confirmPasswordController,
        hintText: context.tr('Confirm_Your_Password'),
        prefixIcon: Icons.lock,
        hintStyle: MyTextStyles.font14GreyRegular,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, style: BorderStyle.solid, color: MyColors.navyBlue)),
        cursorColor: const Color.fromARGB(255, 235, 209, 209),
        keyboardType: TextInputType.visiblePassword,
        color: Colors.transparent);
  }
}
