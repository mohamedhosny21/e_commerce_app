import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';

class HomeTitles extends StatelessWidget {
  const HomeTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('home_title'),
          style: MyTextStyles.font40NavyBlueBold,
        ),
        Text(
          context.tr('home_subtitle'),
          style: MyTextStyles.font20GreyBold,
        ),
      ],
    );
  }
}
