
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({super.key, required this.url});

  late final WebViewController _controller = WebViewController()
    ..loadRequest(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      // FIXME: POP 제대로 안되고 있다.
                      Navigator.of(context).pop();
                      //GoRouter.of(context).pop();
                    },
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(
                        right: 48), // IconButton 길이만큼 빼줌(가운데 위치시키기 위해)
                    child: Text(
                      '이용약관',
                      style: TextStyle(fontSize: 16, color: Colors.black),
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