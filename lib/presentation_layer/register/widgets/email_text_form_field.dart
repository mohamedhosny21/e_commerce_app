import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widgets/textformfield_widgets.dart';

typedef GetEmail = Function(String email);

class EmailTextFormField extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final GetEmail getEmail;
  EmailTextFormField({super.key, required this.getEmail});

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
        validator: (inputValue) {
          if (inputValue!.isEmpty) {
            return 'required'.tr();
          }
          return null;
        },
        onSaved: (emailValue) {
          getEmail(emailValue!);
        },
        controller: _emailController,
        hintText: 'Enter_Your_Email'.tr(),
        prefixIcon: Icons.email,
        hintStyle: MyTextStyles.font14GreyRegular,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, style: BorderStyle.solid, color: MyColors.navyBlue)),
        cursorColor: const Color.fromARGB(255, 235, 209, 209),
        keyboardType: TextInputType.emailAddress,
        color: Colors.transparent);
  }
}
