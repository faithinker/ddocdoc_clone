import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../home/component/grey_container.dart';
import '../../../utils/resources.dart';

class WriteModalBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        final screenContext = MediaQuery.of(context);
        return SizedBox(
          height: 750 + screenContext.padding.bottom,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      R.howToWriteType,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  height: 340.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: R.communityTabList.length - 1,
                    itemBuilder: (BuildContext context, int index) {
                      bool isNotLast = R.communityTabList.length - 2 != index;
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        // padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              R.communityTabList[index + 1],
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            if (isNotLast) ...[
                              const SizedBox(height: 15),
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ]
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.square),
                      SizedBox(width: 5),
                      Text(R.helpDdocdac),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
