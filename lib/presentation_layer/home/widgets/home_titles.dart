import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class HomeTitles extends StatelessWidget {
  const HomeTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Eat Fresh Pizza',
          style: MyTextStyles.font40NavyBlueBold,
        ),
        Text(
          'Our daily fresh pizza',
          style: MyTextStyles.font20GreyBold,
        ),
      ],
    );
  }
}
