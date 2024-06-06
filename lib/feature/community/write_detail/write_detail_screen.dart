import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources.dart';
import '../../../component/custom_alert_dialog.dart';
import '../../../component/custom_header.dart';

class WriteDetailScreen extends ConsumerWidget {
  WriteDetailScreen({super.key, required this.id});

  final String id;

  final double screenWidth = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        CustomHeader(centerText: R.postWrite),
        Text('data: $id'),
      ],
    );
  }
}
