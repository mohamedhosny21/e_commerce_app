import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/widgets/textformfield_widgets.dart';

typedef GetUserName = Function(String userName);

class UserNameTextFormField extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final GetUserName getUserName;

  UserNameTextFormField({super.key, required this.getUserName});

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
        onSaved: (userNameValue) {
          getUserName(userNameValue!);
        },
        validator: (inputValue) {
          if (inputValue!.isEmpty) {
            return 'required0'.tr();
          }
          return null;
        },
        controller: _userNameController,
        hintText: 'Enter_Your_Name'.tr(),
        prefixIcon: Icons.person,
        hintStyle: MyTextStyles.font14GreyRegular,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(
                width: 2, style: BorderStyle.solid, color: MyColors.navyBlue)),
        cursorColor: const Color.fromARGB(255, 235, 209, 209),
        keyboardType: TextInputType.name,
        color: Colors.transparent);
  }
}
