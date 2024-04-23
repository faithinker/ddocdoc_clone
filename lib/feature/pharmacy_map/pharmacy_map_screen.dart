import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../../component/custom_button.dart';
import '../../utils/preference_item_provider.dart';

class PharmacyMapScreen extends ConsumerWidget {
  const PharmacyMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefsProvider = ref.read(preferenceItemProvider.notifier);

    final dongLocation =
        prefsProvider.getStringPreferenceValue(PrefernceKey.dongLocation);

    final List<double> position = prefsProvider
        .getStringPreferenceValue(PrefernceKey.position)
        .split(',')
        .map((s) => double.parse(s))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                children: [
                  Text(
                    '$dongLocation 약국',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                      target: NLatLng(position[1], position[0]), zoom: 17),
                  //locationButtonEnable: true,
                ),
                onMapReady: (mapController) async {
                  await mapController.getLocationOverlay();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
