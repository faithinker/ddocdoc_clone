import 'package:flutter/material.dart';
import '../tile/recommend_tile.dart';
import '../tile/recent_tile.dart';
import '../tile/sub_title_tile.dart';
import '../../../component/custom_button.dart';

class SearchScrollScreen extends StatelessWidget {
  SearchScrollScreen({super.key});

  List<List<String>> sampleDataList = [
    ['의원1', '04.05'],
    ['의원2', '04.06'],
    ['의원3', '04.07'],
    ['의원4', '04.08'],
    ['의원5', '04.09'],
  ];

  List<String> recommendKeywords = ['영유아검진', '똑닥예약병원', '야간진료', '독감예방접종', '여의사'];

  // MARK: 기본적으로 3개, 검색어 있을 경우 4개 추가
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleDataList.length + 4,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SubTitleTile(subTitleType: SearchSubTitleType.recommend);
        } else if (index == 1) {
          return RecommendTile(texts: recommendKeywords);
        } else if (index == 2) {
          return const SubTitleTile(subTitleType: SearchSubTitleType.recent);
        } else if (index == sampleDataList.length + 3) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.centerRight,
            child: CustomButton(
                text: '전체삭제',
                backgroundColor: Colors.white,
                dimensions: const [70, 35],
                border:
                    Border.all(color: Colors.black.withOpacity(0.1), width: 1),
                onTap: () {}),
          );
        } else {
// TODO: 최근 검색어 제목(타이틀), 리스트 없을 경우 : 최근 검색어가 없습니다. => ZStack Container 사용?
          return RecentTile(
              text: sampleDataList[index - 3][0],
              date: sampleDataList[index - 3][1]);
        }
      },
    );
  }
}
