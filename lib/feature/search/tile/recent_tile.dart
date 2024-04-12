import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_provider.dart';

class RecentTile extends ConsumerWidget {
  final int order;
  final String text;
  final String date;

  const RecentTile(
      {super.key, required this.order, required this.text, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            GestureDetector(
              child: Icon(
                Icons.cancel,
                color: Colors.black.withOpacity(0.4),
                size: 22,
              ),
              onTap: () {
                ref.read(searchStateProvider.notifier).removeSearch(order);
              },
            )
          ],
        ));
  }
}
