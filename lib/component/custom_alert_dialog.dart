import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flash/flash.dart';

/// TODO: 밑에서부터 Toast
void showSimpleFlash(BuildContext context, String text) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 2),
    builder: (context, controller) {
      return FlashBar(
        controller: controller,
        title: const Text('TODO'),
        content: Text(text),
      );
    },
  );
}

/// MARK: 기본형 Custom Alert
void showAlertDialog(
  BuildContext context, {
  String? popNamed,
  required String titleText,
  required String descriptionText,
  required List<String> buttonTexts,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      List<Widget> buttons = buttonTexts.asMap().entries.map((entry) {
        int index = entry.key;
        String text = entry.value;

        if (index == 0) {
          return OutlinedButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(text),
          );
        } else if (index == 1) {
          return ElevatedButton(
            onPressed: () {
              if (popNamed != null) {
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == popNamed);
              } else {
                GoRouter.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(text),
          );
        } else {
          return const SizedBox.shrink();
        }
      }).toList();

      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          height: buttonTexts.length == 2 ? 250 : 300,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    descriptionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonMinWidth: 20,
                    children: buttons,
                  ),
                ],
              )),
        ),
      );
    },
  );
}

// TODO: 시스템 Alert

void showSystemAlertDialog(
  BuildContext context, {
  String? popNamed,
  Text? titleWidget,
  List<Widget> bodyWidgets = const <Widget>[],
  List<String> actionTexts = const [],
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: titleWidget,
          content: SingleChildScrollView(
            child: ListBody(
              children: bodyWidgets,
            ),
          ),
          actions: [
            for (var i = 0; i < actionTexts.length; i++) ...[
              TextButton(
                child: Text(actionTexts[i]),
                onPressed: () {
                  if (i == 0) {
                    GoRouter.of(context).pop();
                  } else {
                    if (popNamed != null) {
                      Navigator.of(context)
                          .popUntil((route) => route.settings.name == popNamed);
                    } else {
                      GoRouter.of(context).pop();
                    }
                  }
                },
              ),
            ],
          ],
        );
      });
}

/// TODO: 시스템 Dialog 사용
void showdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What do you want to remember?'),
                  ),
                  SizedBox(
                    width: 320.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
