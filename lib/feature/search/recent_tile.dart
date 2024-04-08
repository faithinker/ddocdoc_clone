import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentTile extends StatelessWidget {
  final String text;
  final String date; // mm.nn

  const RecentTile({super.key, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text(text, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Text(date,
                style: TextStyle(
                    fontSize: 15, color: Colors.black.withOpacity(0.3))),
            const SizedBox(width: 20),
            Icon(
              Icons.cancel,
              color: Colors.black.withOpacity(0.4),
              size: 22,
            )
          ],
        ));
  }
}
