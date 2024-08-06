import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/styles.dart';

import '../../../core/constants/dimensions.dart';

class SocialRegisterButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final IconData buttonIcon;
  final Color iconColor;
  final VoidCallback onPressed;

  const SocialRegisterButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonIcon,
      required this.iconColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: MaterialButton(
          elevation: 0,
          onPressed: onPressed,
          color: buttonColor,
          minWidth: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                buttonIcon,
                color: iconColor,
              ),
              AppDimensions.horizontalSpacing10,
              Text(
                buttonText,
                style: MyTextStyles.font18BlackBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
