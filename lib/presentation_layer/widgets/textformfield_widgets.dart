// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/styles.dart';

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
            return 'required*';
          }
          return null;
        },
        controller: _userNameController,
        hintText: 'Enter Your User Name ',
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
            return 'required*';
          }
          return null;
        },
        onSaved: (emailValue) {
          getEmail(emailValue!);
        },
        controller: _emailController,
        hintText: 'Enter Your Email ',
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
            return 'must be at least 8 characters';
          }
          return null;
        },
        onSaved: (passwordValue) {
          widget.getPassowrd(passwordValue!);
        },
        controller: widget.passwordController,
        obscureText: isVisible ? false : true,
        hintText: 'Enter Your Password ',
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
            return 'must be at least 8 characters';
          } else if (widget.passwordController.text !=
              _confirmPasswordController.text) {
            return 'Password not match';
          }
          return null;
        },
        controller: _confirmPasswordController,
        hintText: 'Confirm Your Password ',
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
