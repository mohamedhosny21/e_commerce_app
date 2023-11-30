import 'package:flutter/material.dart';
import 'package:home_slice/constants/colors.dart';

Widget buildTextFormField(
    {required TextInputType keyboardType,
    bool obscureText = false,
    TextEditingController? controller,
    String Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String?)? onSaved,
    InputBorder? border,
    Color? prefixIconColor,
    Color? suffixIconColor,
    Widget? label,
    String? hintText,
    TextStyle? hintStyle,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? suffixOnPressed}) {
  return Container(
    color: Colors.white,
    margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
    child: TextFormField(
      onTapOutside: (event) {
        //to hide the focus from textformfield when tapping on something else
        FocusManager.instance.primaryFocus!.unfocus();
      },
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      cursorColor: Colors.black,
      onSaved: onSaved,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColors.myNavyBlue)),
        hintText: hintText,
        hintStyle: hintStyle,
        label: label,
        prefixIcon: Icon(
          prefixIcon,
          size: 30,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            size: 30,
          ),
          onPressed: suffixOnPressed,
          color: Colors.grey,
        ),
        prefixIconColor: prefixIconColor,
        border: border ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
