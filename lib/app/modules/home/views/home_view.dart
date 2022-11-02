import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/city.dart';
import '../../../data/models/tips.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../providers/recommended_space_provider.dart';
import '../widgets/city_card.dart';
import '../widgets/space_card.dart';
import '../widgets/tips_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedSpace = ref.watch(recommendedSpaceFutureProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                  child: Text(
                    AppStings.explorNow,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeExtraOverLarge,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                const Padding(
                  padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                  child: Text(
                    AppStings.mencariKosan,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeLarge,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingSizeExtraLarge),
                const Padding(
                  padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                  child: Text(
                    AppStings.popularCities,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeLarge,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingSizeDefault),
                SizedBox(
                  height: 150.0,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingSizeLarge),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final city = popularCities[index];
                      return CityCard(city: city);
                    },
                    itemCount: popularCities.length,
                    separatorBuilder: (context, index) => const SizedBox(width: AppDimensions.paddingSizeExtraLarge),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingSizeExtraLarge),
                const Padding(
                  padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                  child: Text(
                    AppStings.recommendedSpace,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeLarge,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.paddingSizeDefault),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingSizeLarge),
                  child: recommendedSpace.when(
                    data: (data) => Column(
                      children: [
                        ...data
                            .map((e) => Column(
                                  children: [
                                    SpaceCard(space: e),
                                    const SizedBox(height: AppDimensions.paddingSizeExtraLarge),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const CircularProgressIndicator.adaptive(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                  child: Text(
                    AppStings.tipsGuidance,
                    style: TextStyle(
                      fontSize: AppDimensions.fontSizeLarge,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.paddingSizeLarge),
                  child: Column(
                    children: [
                      ...tipsData
                          .map(
                            (e) => Column(
                              children: [
                                TipsCard(
                                  tips: e,
                                ),
                                const SizedBox(height: AppDimensions.paddingSizeExtraLarge),
                              ],
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(AppDimensions.radiusExtraLarge),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BottomNavbarItem(
                  imageUrl: AppImages.iconHome,
                  isActive: true,
                ),
                BottomNavbarItem(
                  imageUrl: AppImages.iconEmail,
                  isActive: false,
                ),
                BottomNavbarItem(
                  imageUrl: AppImages.iconCard,
                  isActive: false,
                ),
                BottomNavbarItem(
                  imageUrl: AppImages.iconLove,
                  isActive: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
