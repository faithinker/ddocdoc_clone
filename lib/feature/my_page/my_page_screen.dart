import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flash/flash_helper.dart';
import '../../feature/my_page/list/item_list.dart';
import '../../feature/my_page/list/my_list.dart';

final scrollProvider =
    StateProvider<ScrollController>((ref) => ScrollController());

// TODO: 스크롤 할 때 Top Navigation에 마이페이지 로그인 hidden 처리 false => riverpod watch로 구현
class MyPageScreen extends ConsumerWidget {
  MyPageScreen({super.key});

  final List<String> mySubTitles = [
    '나의 관리',
    '나의 서류',
    '고객센터',
  ];

  final List<Manage> manages = [
    const Manage(text: '멤버십 관리'),
    const Manage(text: '우리아이 키·몸무게', isNew: true),
    const Manage(text: '결제수단 관리'),
    const Manage(text: '진료내역'),
    const Manage(text: '접수·예약 페널티'),
    const Manage(text: '찜한 병원'),
  ];

  final List<Manage> documents = [
    const Manage(text: '실손보험 청구'),
    const Manage(text: '모바일 서류보관함'),
  ];

  final List<List<String>> csCenters = [
    ['1:1 채팅 상담', '공지사항'],
    ['약관 보기', '버전 v10.12.N'],
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.showToast(Text('TODO: 알림 화면 이동'));
                    },
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black.withOpacity(0.5),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      context.showToast(Text('TODO: 설정 화면 이동'));
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black.withOpacity(0.5),
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            '마이페이지',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow,
                            ),
                            child: const Center(
                              child: Text(
                                '로그인',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: screenWidth,
                        height: 130,
                        child: ItemList(),
                      ),
                    ],
                  ),
                ),
                MyList(subTitle: mySubTitles[0], manages: manages),
                Divider(thickness: 10, color: Colors.black.withOpacity(0.035)),
                MyList(subTitle: mySubTitles[1], manages: documents),
                Divider(thickness: 10, color: Colors.black.withOpacity(0.035)),
                MyList(subTitle: mySubTitles[2], csCenters: csCenters),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
