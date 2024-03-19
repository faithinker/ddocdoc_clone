import 'package:flutter/material.dart';

class THeader extends StatelessWidget {
  const THeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '커뮤니티',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
