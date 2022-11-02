import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  const FacilityItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: const TextStyle(color: AppColors.purpleColor),
            children: [
              TextSpan(
                text: ' $name',
                style: const TextStyle(color: AppColors.greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
