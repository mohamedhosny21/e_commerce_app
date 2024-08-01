import 'package:flutter/material.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/generated/l10n.dart';

typedef GetToggleButtonIndex = void Function(int index);

class MyToggleButton extends StatefulWidget {
  final List<bool> selectedToggleButton;
  final GetToggleButtonIndex getToggleButtonIndex;
  const MyToggleButton(
      {super.key,
      required this.getToggleButtonIndex,
      required this.selectedToggleButton});
  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.white,
      textStyle: MyTextStyles.font20WhiteBold,
      selectedBorderColor: MyColors.navyBlue,
      borderRadius: BorderRadius.circular(8),
      borderColor: Colors.black,
      fillColor: MyColors.navyBlue,
      color: MyColors.navyBlue,
      borderWidth: 3,
      onPressed: (index) {
        setState(() {
          widget.getToggleButtonIndex(index);

          for (int buttonIndex = 0;
              buttonIndex < widget.selectedToggleButton.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              widget.selectedToggleButton[buttonIndex] = true;
            } else {
              widget.selectedToggleButton[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: widget.selectedToggleButton,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 100.0,
      ),
      children: [
        Text(
          S.of(context).Sign_Up,
        ),
        Text(
          S.of(context).Login,
        ),
      ],
    );
  }
}
