import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'banner.dart';
import 'component/grey_container.dart';
import 'component/search_bar_widget.dart';
import 'component/special_list_view.dart';
import 'component/sub_title.dart';
import 'component/horizontal_list_view.dart';
import 'component/big_size_banner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import '../../component/login_modal_bottom_sheet.dart';

/*
 Client ID : qyfcvnrnq8
 Client Secret : 195ciZHEgf8gtguBzuu4nJ1GTIurCxUaRxqYCGJ0

*/

final locationFutureProvider = FutureProvider<String>((ref) async {
  GeolocatorApple.registerWith();
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('jhkim: $position');



    return '성공';
  } catch (e) {
    // 기본 위치 설정
    print('Error fetching location: $e');
    return '실패';
  }
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double imageWidth = MediaQuery.of(context).size.width - 40;
    final locationAsyncValue = ref.watch(locationFutureProvider);
    return locationAsyncValue.when(
      data: (location) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Icon(FontAwesomeIcons.locationCrosshairs),
                              const SizedBox(width: 10),
                              Text(
                                location,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  LoginModalBottomSheet.show(context);
                                },
                                child: const Icon(Icons.people_outline),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  LoginModalBottomSheet.show(context);
                                },
                                child: const Icon(Icons.star_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push('/search');
                        },
                        child: const SearchBarWidget(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                //ImageSliderDemo(),
                const BannerWidget(),
                const SizedBox(height: 20),
                GreyContainer(
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
                                  fontSize: 16, fontWeight: FontWeight.w600),
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
                                  fontSize: 16, fontWeight: FontWeight.w600),
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25),
                  width: imageWidth,
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '우리 아이 잘 크고 있을까?',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '성장발달 계산도 똑닥!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ]),
                ),

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
                Container(
                  width: imageWidth,
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.piano,
                            size: 40,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '내 주변 약국 찾기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '지도에서 내 주변 약국을 확인해보세요.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                BigSizeBanner(),

                const SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        return Text('jhkim - Error fetching location: $error');
      },
    );
  }
}
