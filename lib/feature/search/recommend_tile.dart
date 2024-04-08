import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecommendTile extends StatelessWidget {
  const RecommendTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text.rich(TextSpan(children: [
            TextSpan(text: '추천', style: TextStyle(color: Colors.redAccent)),
            TextSpan(text: '검색어', style: TextStyle(color: Colors.black)),
          ])),
          // TODO: 추천검색어 2줄 이상
          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // 그리드의 열 개수를 설정합니다.
          //   ),
          //   itemCount: 2,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(); // 그리드 항목 위젯을 반환합니다.
          //   },
          // ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
