import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/styles.dart';

import '../../constants/dimensions.dart';

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
