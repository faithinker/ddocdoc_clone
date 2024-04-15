import 'package:flutter/material.dart';
import '../feature/home/component/grey_container.dart';

class LoginModalBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        final screenContext = MediaQuery.of(context);
        return SizedBox(
          height: 320 + screenContext.padding.bottom,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  '로그인 후에 \n서비스를 이용할 수 있어요.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '똑닥 로그인 후 더 많은 서비스를 경험해보세요.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: screenContext.size.width - 40,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bubble_chart),
                        SizedBox(width: 5),
                        Text('카카오로 시작하기'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: GreyContainer(
                    imageWidth: screenContext.size.width - 40,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.apple),
                        SizedBox(width: 5),
                        Text('Apple로 시작하기'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    child: Text(
                      '다음에 하기',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
