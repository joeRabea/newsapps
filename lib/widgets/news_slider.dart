
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_color.dart';



class NewsSliderWidget extends StatefulWidget {
  const NewsSliderWidget({super.key});

  @override
  State<NewsSliderWidget> createState() => _NewsSliderWidgetState();
}

class _NewsSliderWidgetState extends State<NewsSliderWidget> {
  int _index = 0;
  var controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            aspectRatio: 2.0,
            initialPage: 0,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/rodri.jpg', fit: BoxFit.cover),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
            controller: PageController(initialPage: _index),
            count: 5,
            effect: ScrollingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                radius: 12,
                activeDotColor: AppColor.lemonada), // your preferred effect
            onDotClicked: (index) {
              controller.animateToPage(index);
            }),
      ],
    );
  }
}
