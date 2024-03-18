import 'package:flutter/material.dart';

class BannerType {
  final Color backgroundColor;
  final String titleText;
  final String descriptionText;
  final Color titleColor;
  final Color descriptionColor;
  final Widget image;

  const BannerType({
    required this.backgroundColor,
    required this.titleText,
    required this.descriptionText,
    required this.titleColor,
    this.descriptionColor = Colors.black,
    this.image = const SizedBox(),
  });
}

class BigSizeBanner extends StatelessWidget {
  final List<BannerType> items = [
    BannerType(
        backgroundColor: Colors.red.withOpacity(0.2),
        titleText: '여기서 확인할 수 있어요',
        descriptionText: '페널티 몇 번 받았지?\n확인하고 싶다면',
        titleColor: Colors.red.withOpacity(0.7)),
    BannerType(
      backgroundColor: Colors.yellow.withOpacity(0.2),
      titleText: '약사쌤이 알려드려요!',
      descriptionText: '끈적한 가래,\n어떻게 뺄 수 있나요?',
      titleColor: Colors.orange.withOpacity(0.5),
    ),
    BannerType(
        backgroundColor: const Color.fromARGB(255, 14, 2, 36).withOpacity(0.9),
        titleText: '똑닥 자주 묻는 질문',
        descriptionText: '무엇이든 물어보세요\n답변이 모여있어요',
        titleColor: Colors.white,
        descriptionColor: Colors.white),
    BannerType(
      backgroundColor: Colors.blue.withOpacity(0.2),
      titleText: '보는 방법, 알려드릴게요',
      descriptionText: '접수 전에 대기순서\n못 보는 걸까요?',
      titleColor: const Color.fromARGB(255, 12, 4, 176).withOpacity(0.5),
    ),
  ];

  BigSizeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (BannerType item in items)
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                decoration: BoxDecoration(
                  color: item.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.titleText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: item.titleColor,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.descriptionText,
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: item.descriptionColor,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.star,
                      size: 100,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          )
      ],
    );
  }
}