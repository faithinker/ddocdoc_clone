import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../component/custom_button.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 130,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const Icon(Icons.arrow_back_ios),
                              SearchTextField(),
                              const Icon(Icons.search),
                            ],
                          ),
                          //Container(),
                          const SearchScrollScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScrollScreen extends StatelessWidget {
  const SearchScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  String? keyword;

  SearchTextField({super.key, this.keyword});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.07),
        prefixIcon: const Icon(Icons.search),
        hintText: '질병, 진료과, 병원을 검색해보세요.',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onChanged: (value) {
        print('Search query: $value');
      },
    );
  }
}
