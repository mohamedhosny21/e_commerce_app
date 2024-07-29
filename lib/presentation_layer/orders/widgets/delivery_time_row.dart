import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';

class DeliveryTimeRow extends StatelessWidget {
  const DeliveryTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Text('Delivery Time'),
          AppDimensions.horizontalSpacing10,
          const Icon(
            Icons.alarm,
            color: Colors.purple,
          ),
          AppDimensions.horizontalSpacing5,
          const Text('15 min'),
        ],
      ),
    );
  }
}
