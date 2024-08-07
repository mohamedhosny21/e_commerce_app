// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../constants/styles.dart';

class MyTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool? obscureText;
  final Color color;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final BorderRadius? borderRadius;
  final AutovalidateMode? autovalidateMode;
  final InputBorder? border;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? cursorColor;
  final String? hintText;
  final String? label;
  final TextStyle? hintStyle;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnPressed;

  const MyTextFormField({
    super.key,
    required this.keyboardType,
    this.obscureText,
    required this.color,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.borderRadius,
    this.autovalidateMode,
    this.border,
    this.prefixIconColor,
    this.suffixIconColor,
    this.cursorColor,
    this.hintText,
    this.label,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: borderRadius ?? BorderRadius.circular(0)),
      margin: AppDimensions.marginFromSTEB_20_0_20_10,
      child: TextFormField(
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        onTapOutside: (event) {
          //to hide the focus from textformfield when tapping on something else
          FocusManager.instance.primaryFocus!.unfocus();
        },
        style: MyTextStyles.font14NavyBlueRegular,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
        cursorColor: cursorColor,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: MyTextStyles.font20WhiteRegular,
          focusedBorder: border ??
              OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  borderSide: const BorderSide(color: MyColors.navyBlue)),
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: Icon(
            prefixIcon,
            size: 30,
            color: MyColors.navyBlue,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              size: 30,
              color: MyColors.navyBlue,
            ),
            onPressed: suffixOnPressed,
            color: Colors.grey,
          ),
          prefixIconColor: prefixIconColor,
          enabledBorder: border ??
              OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
