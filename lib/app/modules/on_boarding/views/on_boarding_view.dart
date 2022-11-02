import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/app_utils.dart';
import '../../../widgets/app_widgets.dart';

class OnBoardingView extends ConsumerWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(AppImages.splashImage),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingSizeExtraLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 50.0,
                    height: 50.0,
                  ),
                  const SizedBox(height: AppDimensions.paddingSizeExtraLarge),
                  const Text(
                    AppStings.findCozy,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeExtraOverLarge,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.paddingSizeSmall),
                  const Text(
                    AppStings.findCozyDesc,
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: AppDimensions.fontSizeLarge,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  AppElevatedButton(
                    onPressed: () => context.goNamed('home'),
                    title: AppStings.explorNow,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
