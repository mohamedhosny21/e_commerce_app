import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class RegisterButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const RegisterButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      color: MyColors.navyBlue,
      minWidth: 200,
      child: Text(
        buttonText,
        style: MyTextStyles.font20WhiteBold,
      ),
    );
  }
}
