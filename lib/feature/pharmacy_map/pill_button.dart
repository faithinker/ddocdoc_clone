import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class PillButtonNotifier extends StateNotifier<bool> {
  PillButtonNotifier() : super(false);

  void toggle() => state = !state;
}

final pillButtonProvider =
    StateNotifierProvider<PillButtonNotifier, bool>((ref) {
  return PillButtonNotifier();
});

class PillButton extends ConsumerStatefulWidget {
  const PillButton({super.key});

  @override
  _PillButtonState createState() => _PillButtonState();
}

class _PillButtonState extends ConsumerState<PillButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  bool _isHidden = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _widthAnimation = Tween<double>(begin: 50, end: 120).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if ((status == AnimationStatus.completed) ||
          (status == AnimationStatus.dismissed)) {
        _isHidden = !_isHidden;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    final isExpanded = ref.read(pillButtonProvider);
    if (isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }

    ref.read(pillButtonProvider.notifier).toggle();

    Timer(const Duration(seconds: 3), () {
      final isExpanded = ref.read(pillButtonProvider);
      if (isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }

      ref.read(pillButtonProvider.notifier).toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: _widthAnimation.value,
        height: 50,
        child: ElevatedButton(
          onPressed: _toggleExpansion,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isHidden) ...[
                const Text('연중무휴'),
                const SizedBox(width: 5),
              ],
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }
}
