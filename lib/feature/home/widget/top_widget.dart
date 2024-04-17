import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../component/login_modal_bottom_sheet.dart';
import '../component/search_bar_widget.dart';
import '../../../utils/router_key.dart';


class TopWidget extends StatelessWidget {
  final String position;

  const TopWidget({
    super.key,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(FontAwesomeIcons.locationCrosshairs),
                const SizedBox(width: 10),
                Text(
                  position,
                  style: const TextStyle(fontSize: 18),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    LoginModalBottomSheet.show(context);
                  },
                  child: const Icon(Icons.people_outline),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    LoginModalBottomSheet.show(context);
                  },
                  child: const Icon(Icons.star_outline),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RouterKey.search);
          },
          child: const SearchBarWidget(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}