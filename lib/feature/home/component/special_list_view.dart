import 'package:flutter/material.dart';

class SpecialListView extends StatelessWidget {
  final List<String> items = [
    '독감예방접종',
    '똑닥 예약 병원',
    '야간진료',
    '일요일 진료',
    'X-ray 있는 소아과',
    '입원 가능한 소아과',
  ];

  SpecialListView({super.key});

  // TODO: 글자 길이에 따라 width 너비 가변적으로 조정
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          TextPainter textPainter = TextPainter(
            text: TextSpan(
                text: items[index],
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                    fontWeight: FontWeight.w500)),
            textDirection: TextDirection.ltr,
          )..layout();

          double width = textPainter.width;

          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 20 : 5,
              right: index == items.length - 1 ? 20 : 5,
            ), //EdgeInsets.symmetric(horizontal: 5),
            width: width + 30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
  }
}
