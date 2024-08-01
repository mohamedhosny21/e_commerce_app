import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../generated/l10n.dart';

class HomeTitles extends StatelessWidget {
  const HomeTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).home_title,
          style: MyTextStyles.font40NavyBlueBold,
        ),
        Text(
          S.of(context).home_subtitle,
          style: MyTextStyles.font20GreyBold,
        ),
      ],
    );
  }
}
