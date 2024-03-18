import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final List<(IconData, String)> lists = [
    (Icons.present_to_all, '이벤트·투표'),
    (Icons.people, '가족관리'),
    (Icons.favorite, '건강피드'),
    (Icons.star, '찜한 병원'),
  ];

  ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 가변 길이 = 전체 가로 길이 - padding(양쪽, 부모도 계산) - item 간격 패딩(전체 갯수 - 1/마지막 제외)
    double itemWidth = (MediaQuery.of(context).size.width - 60 - 60) / 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int index) {
            (IconData, String) item = lists[index];
            return Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: itemWidth,
                      height: itemWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.$1,
                        size: itemWidth / 2 - 10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      item.$2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                if (index != lists.length) const SizedBox(width: 20),
              ],
            );
          }),
    );
  }
}
