import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyTtokDakScreen extends ConsumerWidget {
  const MyTtokDakScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: const Center(
      child: Text('나의 똑닥 메인 화면'),
    ));
  }
}
