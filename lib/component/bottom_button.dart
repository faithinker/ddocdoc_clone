import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;

  const BottomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 110,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:
                BorderRadius.circular(30), // Half of the height for an ellipse
            color: Colors.yellow,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, -2),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_sharp,
                color: Colors.black.withOpacity(0.5),
              ),
              const SizedBox(width: 3),
              const Text(
                '글쓰기',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
