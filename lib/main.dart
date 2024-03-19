import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../feature/bottom_tab/tap_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: ChildRemoteReservationApp(),
  ));
}

// final WebViewController _controller = WebViewController()
//       ..loadRequest(Uri.parse('https://ddocdoc.com/terms/service'));
//       WebViewWidget(controller: _controller),

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TabScreen(),
    ),

    GoRoute(path: '/service', builder: (context, state) => WebViewScreen()),
    // GoRoute(
    //   path: '/classA',
    //   builder: (context, state) => ClassA(),
    // ),

    // GoRoute(
    //   path: '/classB',
    //   builder: (context, state) => ClassB(),
    // ),
  ],
);
// https://boostbrothers.notion.site/6f85819f89ac4c3d8ba3240dd6fb0346
// https://boostbrothers.notion.site/57831ade7e8a4935bc1b9e09b0f1965b
class WebViewScreen extends StatelessWidget {
  final WebViewController _controller = WebViewController()
    ..loadRequest(Uri.parse('https://ddocdoc.com/terms/service'));

  WebViewScreen({super.key});

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
                    padding: EdgeInsets.only(right: 48), // IconButton 길이만큼 빼줌(가운데 위치시키기 위해)
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

class ChildRemoteReservationApp extends StatelessWidget {
  const ChildRemoteReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
    );
  }
}
