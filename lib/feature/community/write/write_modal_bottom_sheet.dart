import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import '../../home/component/grey_container.dart';
import '../../../utils/resources.dart';

final selectedRowProvider = StateProvider<int?>((ref) => null);

class WriteModalBottomSheet {
  final void Function(int index)? onTap;

  WriteModalBottomSheet({this.onTap});

  static void show(
    BuildContext context, {
    required void Function(int index) onTap,
    required int? selectedRow,
  }) {

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
                    const SizedBox(height: 5),
                    const Text(
                      R.howToWriteType,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
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
                      return GestureDetector(
                        onTap: () {
                          onTap(index);
                          GoRouter.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    R.communityTabList[index + 1],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: selectedRow != null &&
                                              selectedRow == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  if (selectedRow != null &&
                                      selectedRow == index) ...[
                                    const Spacer(),
                                    const Icon(
                                      Icons.check_circle,
                                    ),
                                  ],
                                ],
                              ),
                              if (isNotLast) ...[
                                const SizedBox(height: 15),
                                const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        const Icon(Icons.square),
                        const SizedBox(width: 5),
                        const Text(R.helpDdocdac),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
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
