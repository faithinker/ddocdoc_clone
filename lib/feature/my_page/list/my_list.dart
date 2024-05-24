import 'package:flutter/material.dart';
import '../../../feature/my_page/tile/my_cs_center_tile.dart';

class Manage {
  final String text;
  final bool isNew;

  const Manage({required this.text, this.isNew = false});
}

class MyList extends StatelessWidget {
  final String subTitle;
  final List<Manage> manages;
  final List<List<String>> csCenters; // customerCenter

  const MyList({
    Key? key,
    required this.subTitle,
    this.manages = const [],
    this.csCenters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 10), // 이거 없앤다고 공백 줄어들지 않는다.
          
          csCenters.isEmpty
              ? MyManageList(manages: manages)
              : MyCSCenterTile(
                  items: csCenters,
                ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MyManageList extends StatelessWidget {
  final List<Manage> manages;

  const MyManageList({Key? key, required this.manages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: manages.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  manages[index].text,
                  style: const TextStyle(fontSize: 16),
                ),
                if (manages[index].isNew == true)
                  Container(
                    width: 35,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.red.withOpacity(0.8)),
                    child: const Center(
                      child: Text(
                        'NEW',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(height: 15),
            if (index != manages.length - 1)
              Divider(indent: 5, color: Colors.black.withOpacity(0.2)),
          ],
        );
      },
    );
  }
}
