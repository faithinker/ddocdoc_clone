import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../component/custom_button.dart';
import 'recommend_tile.dart';
import 'recent_tile.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SearchTextField(),
                            ),
                            const Icon(Icons.search),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomButton(
                                text: '가산동',
                                icon: Icons.my_location_outlined,
                                backgroundColor: Colors.black.withOpacity(0.05),
                                frontColor: Colors.black.withOpacity(0.6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 1),
                                edge: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                corner: 8,
                                onTap: () {}),
                            const SizedBox(width: 10),
                            CustomButton(
                                text: '진료과목',
                                icon: Icons.local_hospital_outlined,
                                backgroundColor: Colors.black.withOpacity(0.05),
                                frontColor: Colors.black.withOpacity(0.7),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 1),
                                edge: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                corner: 8,
                                onTap: () {}),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Divider(thickness: 2, color: Colors.black.withOpacity(0.035)),
                ],
              ),
            ),
            Expanded(child: SearchScrollScreen()),
          ],
        ),
      ),
    );
  }
}

class SearchScrollScreen extends StatelessWidget {
  SearchScrollScreen({super.key});

  List<List<String>> sampleDataList = [
    ['의원1', '04.05'],
    ['의원2', '04.06'],
    ['의원3', '04.07'],
    ['의원4', '04.08'],
    ['의원5', '04.09'],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleDataList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const RecommendTile();
        }
        // TODO: 최근 검색어 제목(타이틀), 리스트 없을 경우 : 최근 검색어가 없습니다. => ZStack Container 사용?
        return RecentTile(
            text: sampleDataList[index-1][0], date: sampleDataList[index-1][1]);
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  String? keyword;

  SearchTextField({super.key, this.keyword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: '증상 또는 병원을 검색해보세요.',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onChanged: (value) {
        print('Search query: $value');
      },
    );
  }
}
