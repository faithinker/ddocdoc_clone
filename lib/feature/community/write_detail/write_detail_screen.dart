import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources.dart';
import '../../../component/custom_alert_dialog.dart';
import '../../../component/custom_header.dart';

class WriteDetailScreen extends ConsumerWidget {
  WriteDetailScreen({super.key, required this.id});

  final String id;

  final double screenWidth = ScreenUtil().screenWidth;

  // TODO: 글까지는 padding 적용, 이후 Divider를 양쪽 끝에 넣어야 함

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CustomHeader(leftIcon: IconType.prev, centerText: R.postDetail),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '댕이맘',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2시간 전',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert),
                        const SizedBox(width: 5),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '가나다라마바사 아자차카 타파하 이것은 한글 테스트입니다. 라라와와아',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '본문 테스트 글자입니다. \n\n\n\n여러줄 테스트\n\n 마지막줄입니다.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconTextWidget(
                            icon: Icons.favorite_outline,
                            text: '좋아요',
                            onTap: () {
                              print('Favorite');
                            }),
                        const SizedBox(width: 15),
                        IconTextWidget(
                            icon: Icons.sms_outlined,
                            text: '댓글 4',
                            onTap: () {
                              print('comment');
                            }),
                        const SizedBox(width: 15),
                        IconTextWidget(
                            icon: Icons.ios_share_outlined,
                            text: '공유하기',
                            onTap: () {
                              print('share');
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTextWidget extends ConsumerWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: (screenWidth / 3) - 40,
        height: 45,
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(
              text,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
