import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_button.dart';
import 'custom_alert_dialog.dart';
import '../../../utils/resources.dart';

/// MARK: 게시글 상세, 프로필 수정, 프로필, 가족관리, 알림 및 동의 설정, 홈> 찜한 병원
/// 좌측 아이콘 : <, x 버튼
/// 가운데 소제목 Text
/// 우측 버튼(선택사항) : 완료텍스트 버튼, 도움말 아이콘
/// 선택사항 : Divider
class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});

  final double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.close),
          ),
          const Spacer(),
          const Text(
            R.postWrite,
            style: TextStyle(fontSize: 16),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void showCustom() {
    CustomButton(
      text: '등록',
      textSize: 15,
      corner: 8,
      dimensions: const [50, 32],
      border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      onTap: () {},
    );
  }
}
