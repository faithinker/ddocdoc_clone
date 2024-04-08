import 'package:flutter/material.dart';

class CommunityTile extends StatelessWidget {
  const CommunityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      //alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(3)),
              //border: Border.all(color: Colors.blue, width: 1.0),
            ),
            child: const Center(
              child: Text(
                '공지',
                style: TextStyle(fontSize: 11.0),
              ),
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '똑닥이 가져온 좋은 소식 3가지',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '접수할 때, 체크할 게 하나 줄었어요!> 고유식...',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '2주 전•좋아요 31•댓글 28',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1.0,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
