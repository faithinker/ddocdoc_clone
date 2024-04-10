import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SearchSubTitleType { recommend, recent }

class SubTitleTile extends StatelessWidget {
  final SearchSubTitleType subTitleType;

  const SubTitleTile({super.key, required this.subTitleType});

  @override
  Widget build(BuildContext context) {
    String subTitleText = '';
    if (subTitleType == SearchSubTitleType.recommend) {
      subTitleText = '추천';
    } else {
      subTitleText = '최근';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: subTitleText,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: subTitleType == SearchSubTitleType.recommend
                        ? Colors.redAccent
                        : Colors.black)),
            const TextSpan(
                text: ' 검색어',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black)),
          ])),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
