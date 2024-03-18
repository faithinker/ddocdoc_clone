import 'package:flutter/material.dart';

class Department {
  final IconData icon;
  final String name;

  Department({required this.icon, required this.name});
}

class HorizontalListView extends StatelessWidget {
  final List<Department> departments = [
    Department(icon: Icons.child_care, name: '소아청소년과'),
    Department(icon: Icons.favorite, name: '이비인후과'),
    Department(icon: Icons.house, name: '가정의확과'),
    Department(icon: Icons.favorite, name: '산부인과'),
    Department(icon: Icons.vibration, name: '내과'),
    Department(icon: Icons.video_call, name: '정형외과'),
    Department(icon: Icons.tiktok, name: '피부과'),
    Department(icon: Icons.tiktok, name: '안과'),
    Department(icon: Icons.tiktok, name: '정신건강의학과'),
  ];

  // TODO: Server Data Initlation
  // final List<IconData> images = [];
  // final List<IconData> imageList;
  // HorizontalListView({Key? key, required this.imageList}) : super(key: key);

  HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: departments.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                SizedBox(width: index == 0 ? 12 : 0),
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        departments[index].icon,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      departments[index].name,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                SizedBox(width: index == departments.length - 1 ? 12 : 0),
              ],
            ));
      },
    );
  }
}
