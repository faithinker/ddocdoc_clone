import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources.dart';
import '../../../component/custom_alert_dialog.dart';

// TODO: 내 프로필, 타 프로필 한번에 처리

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key, required this.id});

  final String id;

  final double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            Center(
              child: Text('ProfileScreen'),
            )
          ],
        ),
      ),
    );
  }
}
