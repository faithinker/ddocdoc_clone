import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../component/custom_button.dart';

class FavoriteHospitalScreen extends ConsumerWidget {
  const FavoriteHospitalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: CustomButton(
        text: '자녀추가',
        backgroundColor: Colors.black.withOpacity(0.5),
        onPressed: () {
          context.showToast(Text('message (Queue)'));
        },
      ),
    );
  }
}
