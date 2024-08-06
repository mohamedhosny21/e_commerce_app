import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

void showCircularProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    content: Center(
      child: CircularProgressIndicator(
        color: MyColors.navyBlue,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => alertDialog,
      barrierColor: Colors.white.withOpacity(0));
}
