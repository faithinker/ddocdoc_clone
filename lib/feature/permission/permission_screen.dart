import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'tile/permission_tile.dart';
import 'package:permission_handler/permission_handler.dart';

// TODO: 최초 1회만 이 페이지 타도록 Preference 여부 저장

class PermissionScreen extends ConsumerWidget {
  PermissionScreen({super.key});

  final List<PermissonData> permissonData = [
    PermissonData(
        icon: Icons.location_on_outlined,
        title: '위치',
        subtitle: '현재 위치 기준 정확한 병원/약국 정보 표시'),
    PermissonData(
        icon: Icons.camera_outlined,
        title: '카메라',
        subtitle: '비대면진료(화상) 연결, 사진 촬영, 처방전  QR코드 인식을 통한 등록 기능 제공'),
    PermissonData(
        icon: Icons.mic_outlined, title: '마이크', subtitle: '비대면진료(화상) 연결 기능 제공'),
    PermissonData(
        icon: Icons.image_outlined,
        title: '사진',
        subtitle: '프로필 사진 및 이용후기 사진 등록 기능 제공'),
    PermissonData(
        icon: Icons.download_outlined,
        title: '저장',
        subtitle: '서비스 이용을 위해 필요한 사진 및 파일 저장')
  ];

  Future<void> requestPermissions() async {
    // 권한들을 한 번에 요청
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.microphone,
      Permission.photos,
      Permission.notification,
      Permission.appTrackingTransparency,
    ].request();

    // 각 권한에 대한 상태 확인 및 처리
    statuses.forEach((permission, status) {
      if (status.isGranted) {
        // 권한이 허용된 경우
        print('${permission.toString().split('.')[1]} permission granted');
      } else if (status.isDenied) {
        // 사용자가 권한을 거부한 경우
        print('${permission.toString().split('.')[1]} permission denied');
      } else if (status.isPermanentlyDenied) {
        // 사용자가 권한을 영구적으로 거부한 경우
        print(
            '${permission.toString().split('.')[1]} permission permanently denied');
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              '똑닥 앱 이용을 위한 권한 안내',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            Divider(color: Colors.black.withOpacity(0.2)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    '선택 접근권한',
                    style: TextStyle(fontSize: 13),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: permissonData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return PermissionTile(data: permissonData[index]);
                      }),
                  const SizedBox(height: 10),
                  Text(
                    '※선택적 접근권한은 해당 기능 사용 시 요청하며, 동의하지 않아도 서비스 이용 가능',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Text(
                    '※휴대폰 > 설정 > 똑닥 > 접근 허용 메뉴에서 설정 변경 가능',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.yellowAccent, // 배경색// 모서리를 둥글게 만듦
                ),
                child: const Center(
                  child: Text(
                    '확인',
                    style: TextStyle(
                      // 텍스트 색상
                      fontSize: 16.0, // 텍스트 크기
                    ),
                  ),
                ),
              ),
              onTap: () async {
                await requestPermissions();
                GoRouter.of(context).push('/bottom-tab');
              },
            ),
          ],
        ),
      ),
    );
  }
}
