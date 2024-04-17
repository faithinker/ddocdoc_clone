import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../utils/preference_item_provider.dart';
import '../../utils/router_key.dart';

final isOnceProvider = StateProvider<bool>((ref) => true);

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnce = ref.watch(isOnceProvider);
    final prefsProvider = ref.read(preferenceItemProvider.notifier);

    if (isOnce) {
      Future.delayed(const Duration(seconds: 3), () {
        final isSkip = prefsProvider.getPreferenceValue(PrefernceKey.permisson);
        GoRouter.of(context)
            .push(isSkip ? RouterKey.bottomTab : RouterKey.permission);
        ref.read(isOnceProvider.notifier).state = false;
      });
    }

    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('똑닥',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
