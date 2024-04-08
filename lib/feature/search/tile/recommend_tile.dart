import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../component/custom_button.dart';

class RecommendTile extends StatelessWidget {
  final List<String> texts;

  const RecommendTile({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // FIXME: 각 버튼의 너비가 고정되는 문제점이 있다. GriView 자체를 쓰면 안될것 같다..
          GridView.builder(
            itemCount: texts.length,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10, // 세로
              crossAxisSpacing: 10, // 가로
              childAspectRatio: 2.5, // 간격 더 줄이기..
            ),
            itemBuilder: (BuildContext context, int index) {
              return CustomButton(
                  text: texts[index],
                  backgroundColor: Colors.black.withOpacity(0.05),
                  onTap: () {});
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
