import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final titleFocusNodeProvider = Provider<FocusNode>((ref) => FocusNode());
final textFocusNodeProvider = Provider<FocusNode>((ref) => FocusNode());

final keyboardVisibleProvider = StateProvider<bool>((ref) => false);

class CustomKeyboardToolbar extends ConsumerWidget {
  const CustomKeyboardToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool keyboardVisible = ref.watch(keyboardVisibleProvider);
    final FocusNode titleFocusNode = ref.watch(titleFocusNodeProvider);
    final FocusNode textFocusNode = ref.watch(textFocusNodeProvider);

    if (!keyboardVisible) return const SizedBox.shrink();

    return Positioned(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_up),
                    onPressed: () {
                      ref.read(titleFocusNodeProvider).requestFocus();
                    },
                    isSelected: titleFocusNode.hasFocus,
                    selectedIcon: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      ref.read(textFocusNodeProvider).requestFocus();
                    },
                    isSelected: textFocusNode.hasFocus,
                    selectedIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              TextButton(
                child: const Text('완료'),
                onPressed: () {
                  ref.read(titleFocusNodeProvider).unfocus();
                  ref.read(textFocusNodeProvider).unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
