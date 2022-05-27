import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CaroselView extends StatelessWidget {
  CaroselView({Key? key}) : super(key: key);

  List<String> images = ['assets/images/img1.png', 'assets/images/img2.png'];

  List<Widget> CaroselMaker() {
    return images
        .map((element) => Container(
              // margin: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    element,
                    fit: BoxFit.fill,
                  )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: CarouselSlider(
          items: CaroselMaker(),
          options: CarouselOptions(
            height: 225,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
