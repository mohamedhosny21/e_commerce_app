import 'package:flutter/material.dart';
import 'package:home_slice/constants/colors.dart';
import 'package:home_slice/constants/strings.dart';

// ignore: must_be_immutable
class PizzaTypesContainer extends StatelessWidget {
  final Color color;
  final double height;
  final String image;
  VoidCallback? onPressed;
  String? category;
  String buttonText = '';
  String? descText;
  PizzaTypesContainer(
      {super.key,
      required this.color,
      required this.height,
      required this.image,
      required this.buttonText,
      this.onPressed,
      this.descText,
      this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
      // width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage.assetNetwork(
            placeholder: loadingGif,
            image: image,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            category ?? '',
            style: const TextStyle(
                color: MyColors.myNavyBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            descText ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pizza_menu_screen',
                  arguments: category);
            },
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
