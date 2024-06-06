import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

enum IconType {
  prev(Icons.arrow_back_ios),
  close(Icons.close);

  final IconData icon;
  const IconType(this.icon);
}

class CustomHeader extends ConsumerWidget {
  CustomHeader({
    super.key,
    this.leftIcon,
    this.leftOnTap,
    required this.centerText,
    this.rightIcon,
    this.rightWidget,
    this.rightOnTap,
    this.needDivider = false,
    this.needPadding = false,
  });

  final IconType? leftIcon;
  final VoidCallback? leftOnTap;
  final String centerText;
  final IconType? rightIcon;
  final Widget? rightWidget;
  final VoidCallback? rightOnTap;
  final bool needDivider;
  final bool needPadding;

  final double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        showHeader(),
        const SizedBox(height: 5),
        if (needDivider) const Divider(),
      ],
    );
  }

  Widget showHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: needPadding ? 20 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leftIcon != null)
            GestureDetector(
              onTap: () {
                leftOnTap;
              },
              child: Icon(leftIcon!.icon),
            ),
          if (leftIcon == null) const SizedBox(width: 15),
          const Spacer(),
          Text(
            centerText,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
          if (rightIcon != null)
            GestureDetector(
              onTap: () {
                rightOnTap;
              },
              child: Icon(rightIcon!.icon),
            ),
          if (rightWidget != null)
            GestureDetector(
              onTap: () {
                rightOnTap;
              },
              child: rightWidget!,
            ),
          if (rightIcon == null && rightWidget == null)
            const SizedBox(width: 15)
        ],
      ),
    );
  }

  // TODO: 오른쪽 버튼 disable등 상태감지도 해야하므로 추후에 고려
  void showCustomButton() {
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
