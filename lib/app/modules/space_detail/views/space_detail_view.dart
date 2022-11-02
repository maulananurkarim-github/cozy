import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models/space.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/app_elevated_button.dart';
import '../widgets/facility_item.dart';
import '../widgets/rating_item.dart';

final isFavoriteProvider = StateProvider<bool>((ref) {
  return false;
});

class SpaceDetailView extends ConsumerWidget {
  const SpaceDetailView(this.space, {super.key});

  final Space space;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider);
    launchURL(String value) async {
      final Uri url = Uri.parse(value);
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ErrorPage(),
        //   ),
        // );
      }
    }

    Future<void> handleBook(Space space) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text('Apakah kamu ingin menghubungi pemilik kos?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'Nanti',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchURL(space.phone!);
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            space.imageUrl!,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              const SizedBox(
                height: 250,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: TITLE
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSizeLarge,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: AppDimensions.fontSizeOverLarge,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: '\$${space.price}',
                                  style: const TextStyle(
                                    color: AppColors.purpleColor,
                                    fontSize: AppDimensions.fontSizeOverLarge,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: ' / month',
                                      style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: AppDimensions.fontSizeOverLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  left: 2,
                                ),
                                child: RatingItem(
                                  index: index,
                                  rating: space.rating!,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: MAIN FACILITIES
                    const Padding(
                      padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                      child: Text(
                        'Main Facilities',
                        style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSizeLarge,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            name: 'kitchen',
                            imageUrl: 'assets/icon_kitchen.png',
                            total: space.numberOfKitchens!,
                          ),
                          FacilityItem(
                            name: 'bedroom',
                            imageUrl: 'assets/icon_bedroom.png',
                            total: space.numberOfBedrooms!,
                          ),
                          FacilityItem(
                            name: 'Big Lemari',
                            imageUrl: 'assets/icon_cupboard.png',
                            total: space.numberOfCupboards!,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: PHOTO
                    const Padding(
                      padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                      child: Text(
                        'Photos',
                        style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: space.photos!.map((item) {
                          return Container(
                            margin: const EdgeInsets.only(
                              left: 24,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                item,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // NOTE: LOCATION
                    const Padding(
                      padding: EdgeInsets.only(left: AppDimensions.paddingSizeLarge),
                      child: Text(
                        'Location',
                        style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingSizeLarge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${space.address}\n${space.city}',
                            style: const TextStyle(color: AppColors.greyColor),
                          ),
                          InkWell(
                            onTap: () {
                              // launchUrl(
                              //     'https://goo.gl/maps/SyZx2yjWB1yR6AeH8');

                              launchURL(space.mapUrl!);
                            },
                            child: Image.asset(
                              'assets/btn_map.png',
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingSizeLarge,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width - (2 * AppDimensions.paddingSizeLarge),
                      child: AppElevatedButton(
                        onPressed: () {
                          handleBook(space);
                        },
                        title: 'Book Now',
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSizeLarge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(isFavoriteProvider.notifier).state = !ref.read(isFavoriteProvider.notifier).state;
                    },
                    child: Image.asset(
                      isFavorite ? 'assets/btn_wishlist_active.png' : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
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
