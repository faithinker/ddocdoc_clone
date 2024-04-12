import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_provider.dart';
import '../../../component/custom_button.dart';

class AllRemoveTile extends ConsumerWidget {
  const AllRemoveTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.centerRight,
      child: CustomButton(
          text: '전체삭제',
          backgroundColor: Colors.white,
          dimensions: const [70, 35],
          border:
              Border.all(color: Colors.black.withOpacity(0.1), width: 1),
          onTap: () {
            ref.read(searchStateProvider.notifier).removeAll();
          }),
    );
  }
}
