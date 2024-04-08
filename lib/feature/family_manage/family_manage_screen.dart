import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../component/custom_button.dart';

class FamilyManageScreen extends ConsumerWidget {
  const FamilyManageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
