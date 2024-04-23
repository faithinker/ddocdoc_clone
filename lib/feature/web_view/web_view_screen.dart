import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

// velog.io/@lee7198/Flutter-WebView-도입기-2-웹-플러터통신
// todo 닫기 버튼 채널명 찾아서 나가기 버튼 수행
class WebViewScreen extends StatelessWidget {
  final String title;
  final String url;

  WebViewScreen({super.key, required this.url, required this.title});

  late final WebViewController _controller = WebViewController()
    ..loadRequest(Uri.parse(url))
    ..addJavaScriptChannel('name',
        onMessageReceived: (JavaScriptMessage message) {
          print(message.message);
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            if (title.isNotEmpty)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 48), // IconButton 길이만큼 빼줌(가운데 위치시키기 위해)
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            Expanded(child: WebViewWidget(controller: _controller))
          ],
        ),
      ),
    );
  }
}
