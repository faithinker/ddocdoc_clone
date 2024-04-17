import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/router_key.dart';


class MyCSCenterTile extends StatelessWidget {
  final List<List<String>> items;

  const MyCSCenterTile({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        items.length,
        (rowIndex) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            items[0].length,
            (colIndex) => GestureDetector(
              onTap: () {
                context.go(RouterKey.service);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 30,
                height: 50,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.03),
                ),
                child: Center(
                  child: Text(
                    items[rowIndex][colIndex],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WebView')),
        body: const WebViewPage());
  }
}
