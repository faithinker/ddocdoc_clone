library home;

import 'package:ddocdoc_clone/network/navermap_network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'banner.dart';
import 'component/grey_container.dart';
import 'component/special_list_view.dart';
import 'component/sub_title.dart';
import 'component/horizontal_list_view.dart';
import 'component/big_size_banner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import '../../component/login_modal_bottom_sheet.dart';
import '../../model/navermap_model.dart';
import 'package:dio/dio.dart';
import 'widget/child_physical_information_widget.dart';
import 'widget/pharmacy_widget.dart';
import 'widget/top_widget.dart';
import '../../utils/preference_item_provider.dart';
import '../../utils/router_key.dart';
import '../../utils/domain_url.dart';

final locationFutureProvider = FutureProvider<String>((ref) async {
  GeolocatorApple.registerWith();
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return '${position.longitude},${position.latitude}';
  } catch (e) {
    print('Error fetching location: $e');
    return '126.88554683161125,37.482377511815436';
  }
});

final naverMapDataProvider =
    FutureProvider.family<NaverMapModel, String>((ref, position) async {
  final apiClient = ref.watch(naverMapProvider);
  return await apiClient.getTasks(position: position);
});

final naverMapProvider = Provider<NaverMapNetworkService>((ref) {
  final dio = Dio();
  return NaverMapNetworkService(dio);
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // FIXME : 에러 수정
  Future<void> setPrefsData(
      WidgetRef ref, String value, bool isLocation) async {
    print('value: $value $isLocation');
    ref.read(preferenceItemProvider.notifier).setPreferenceItem(
        isLocation ? PrefernceKey.position : PrefernceKey.dongLocation, value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double imageWidth = MediaQuery.of(context).size.width - 40;
    final locationAsyncValue = ref.watch(locationFutureProvider);

    return locationAsyncValue.when(
      data: (location) {
        setPrefsData(ref, location, true);

        final naverMapAsyncValue = ref.watch(naverMapDataProvider(location));
        return naverMapAsyncValue.when(
          data: (naverMapData) {
            final dongLocation = naverMapData.results[0].region.area3.name;

            setPrefsData(ref, dongLocation, false);

            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TopWidget(
                          position: naverMapData.results[0].region.area3.name),
                    ),
                    //ImageSliderDemo(),
                    const BannerWidget(),
                    const SizedBox(height: 20),
                    GreyContainer(
                      onTap: () {
                        GoRouter.of(context)
                            .push(RouterKey.webUrl(DomainURL.appVote));
                      },
                      imageWidth: imageWidth,
                      containerHorizontal: 20,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '실시간 투표 진행 중',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '요즘 가장 핫한 대화 주제는?',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.bar_chart,
                            color: Colors.yellow,
                            size: 55,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GreyContainer(
                            imageWidth: imageWidth / 2 - 5,
                            height: 70,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '동네 인기 병원',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.local_fire_department,
                                  color: Color.fromARGB(255, 211, 46, 34),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          GreyContainer(
                            imageWidth: imageWidth / 2 - 5,
                            height: 70,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '지금 문연 병원',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.light,
                                    color: Color.fromARGB(255, 40, 69, 183),
                                    size: 30),
                              ],
                            ),
                          ),
                          // imageWidth / 2 - 10  35
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ChildPhysicalInformationWidget(imageWidth: imageWidth),
                    const SubTitle(title: '진료과로 병원 찾기 🏥'),
                    SizedBox(
                      height: 130,
                      child: HorizontalListView(),
                    ),
                    const SubTitle(title: '이런 병원 찾고 계신가요?'),
                    SizedBox(
                      height: 60,
                      child: SpecialListView(),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: imageWidth,
                      height: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '영유아 검진 예약하기',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    PharmacyWidget(imageWidth: imageWidth),
                    const SizedBox(height: 25),
                    BigSizeBanner(),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            return Center(
              child: Text('jhkim - Error fetching location: $error'),
            );
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Center(
        child: Text('위치 정보를 가져오는데 실패했습니다: $err'),
      ),
    );
  }
}
