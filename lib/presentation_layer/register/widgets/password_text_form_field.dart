import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widgets/textformfield_widgets.dart';

typedef GetPassowrd = Function(String password);

class PasswordTextFormField extends StatefulWidget {
  final GetPassowrd getPassowrd;
  final TextEditingController passwordController;

  const PasswordTextFormField({
    super.key,
    required this.getPassowrd,
    required this.passwordController,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
        autovalidateMode: AutovalidateMode.always,
        validator: (inputValue) {
          if (inputValue!.isEmpty || inputValue.length < 8) {
            return context.tr('must_be_at_least_8_characters');
          }
          return null;
        },
        onSaved: (passwordValue) {
          widget.getPassowrd(passwordValue!);
        },
        controller: widget.passwordController,
        obscureText: isVisible ? false : true,
        hintText: context.tr('Enter_Your_Password'),
        prefixIcon: Icons.lock,
        suffixIcon: isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        suffixOnPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        hintStyle: MyTextStyles.font14GreyRegular,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, style: BorderStyle.solid, color: MyColors.navyBlue)),
        cursorColor: const Color.fromARGB(255, 235, 209, 209),
        keyboardType: TextInputType.visiblePassword,
        color: Colors.transparent);
  }
}
