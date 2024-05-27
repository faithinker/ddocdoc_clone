import 'package:flutter/material.dart';

class CustomKeyboardToolbarDemo extends StatefulWidget {
  @override
  _CustomKeyboardToolbarDemoState createState() => _CustomKeyboardToolbarDemoState();
}

class _CustomKeyboardToolbarDemoState extends State<CustomKeyboardToolbarDemo> {
  final FocusNode focusNode = FocusNode();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay(context);
      } else {
        removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    removeOverlay();
    super.dispose();
  }

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        // '위' 버튼 로직
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        // '아래' 버튼 로직
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text('완료'),
                  onPressed: () {
                    // '완료' 버튼 로직
                    focusNode.unfocus(); // 키보드 닫기
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay?.insert(overlayEntry!);
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        focusNode: focusNode,
        decoration: InputDecoration(hintText: '여기에 입력하세요'),
      ),
    );
  }
}
