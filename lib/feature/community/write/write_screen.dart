import 'package:ddocdoc_clone/feature/home/component/grey_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../component/custom_button.dart';
import '../../../utils/resources.dart';
import 'package:flash/flash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'write_modal_bottom_sheet.dart';

class WriteScreen extends ConsumerWidget {
  WriteScreen({super.key});

  double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Icon(Icons.close),
                ),
                const Spacer(),
                const Text(
                  '게시글 작성',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                CustomButton(
                  text: '등록',
                  textSize: 15,
                  corner: 8,
                  dimensions: const [50, 32],
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
                  onTap: () {
                    showSimpleFlash(context, 'TODO: 서버에 API Post 쓰기');
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 5),
            Divider(color: Colors.black.withOpacity(0.2)),
            const SizedBox(height: 25),
            GreyContainer(
              imageWidth: screenWidth - 30,
              height: 55,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  R.howToWriteType,
                  style: TextStyle(
                      fontSize: 16, color: Colors.black12.withOpacity(0.3),),
                ),
              ),
              onTap: () {
                WriteModalBottomSheet.show(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showSimpleFlash(BuildContext context, String text) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (context, controller) {
      return FlashBar(
        controller: controller,
        title: const Text('Test'),
        content: Text(text),
      );
    },
  );
}
