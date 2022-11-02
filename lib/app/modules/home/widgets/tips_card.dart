import 'package:flutter/material.dart';

import '../../../data/models/tips.dart';
import '../../../utils/app_utils.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  const TipsCard({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl!,
          width: 80,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tips.title!,
                style: const TextStyle(
                  fontSize: AppDimensions.fontSizeExtraLarge,
                  color: Colors.black,
                )),
            const SizedBox(height: 4),
            Text(
              'Updated ${tips.updatedAt}',
              style: const TextStyle(color: AppColors.greyColor),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_right,
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
