import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChildPhysicalInformationWidget extends StatelessWidget {
  const ChildPhysicalInformationWidget({
    super.key,
    required this.imageWidth,
  });

  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
