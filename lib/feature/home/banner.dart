import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSliderDemo extends StatelessWidget {
  const ImageSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width - 40;
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
      ),
      items: imgList
          .map((item) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                  width: imageWidth,
                  height: 100,
                ),
              ))
          .toList(),
    ));
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1020&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1020&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1020&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1020&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1020&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1020&q=80'
];

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imgList.length,
        options: CarouselOptions(
          viewportFraction: 1.0,
          autoPlay: false,
        ),
        itemBuilder: (context, index, readIdx) {
          double imageWidth = MediaQuery.of(context).size.width - 40;

          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imgList[index],
              fit: BoxFit.fill,
              width: imageWidth,
              height: 10,
            ),
          );
        });
  }
}
