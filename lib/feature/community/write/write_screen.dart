import 'package:ddocdoc_clone/component/custom_keyboard_toolbar.dart';
import 'package:ddocdoc_clone/feature/home/component/grey_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'write_modal_bottom_sheet.dart';
import '../../../utils/router_key.dart';
import '../../../component/custom_button.dart';
import '../../../utils/resources.dart';
import '../../../component/custom_alert_dialog.dart';

final typeProvider = StateProvider((ref) => R.howToWriteType);

class WriteScreen extends ConsumerWidget {
  WriteScreen({super.key});

  final double screenWidth = ScreenUtil().screenWidth;

  final titleTextController = TextEditingController();
  final mainTextController = TextEditingController();

  void dispose() {
    titleTextController.dispose();
    mainTextController.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String typeText = ref.watch(typeProvider);
    final int? selectedRow = ref.watch(selectedRowProvider);
    final FocusNode titleFocusNode = ref.watch(titleFocusNodeProvider);
    final FocusNode textFocusNode = ref.watch(textFocusNodeProvider);

    titleFocusNode.addListener(() {
      if (titleFocusNode.hasFocus) {
        ref.read(keyboardVisibleProvider.notifier).state = true;
      } else {
        ref.read(keyboardVisibleProvider.notifier).state = false;
      }
    });

    textFocusNode.addListener(() {
      if (textFocusNode.hasFocus) {
        ref.read(keyboardVisibleProvider.notifier).state = true;
      } else {
        ref.read(keyboardVisibleProvider.notifier).state = false;
      }
    });

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
                    showAlertDialog(
                      context,
                      popNamed: RouterKey.bottomTab,
                      titleText: '안내',
                      descriptionText: R.stopWritingTitle,
                      buttonTexts: [R.continueWriting, R.exit],
                    );
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
                    showSimpleFlash(context, '서버에 Post Request 요청하기!');
                    GoRouter.of(context).pop();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 5),
            Divider(color: Colors.black.withOpacity(0.2)),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GreyContainer(
                    imageWidth: screenWidth,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text(
                            typeText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      WriteModalBottomSheet.show(
                        context,
                        onTap: (index) {
                          ref.read(typeProvider.notifier).state =
                              R.communityTabList[index + 1];
                          ref.read(selectedRowProvider.notifier).state = index;
                        },
                        selectedRow: selectedRow,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: titleTextController,
                    focusNode: titleFocusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: R.placeholderTitle,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey),
                    ),
                  ),
                  TextField(
                    controller: mainTextController,
                    focusNode: textFocusNode,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: R.plcaholderMainText,
                      hintMaxLines: 5,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print('TODO: 사진 촬영/ 사진에서 선택 Alert 추가');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image_outlined, size: 29, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        '사진추가 0/10',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomKeyboardToolbar(),
          ],
        ),
      ),
    );
  }
}
