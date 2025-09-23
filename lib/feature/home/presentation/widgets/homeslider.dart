import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homeslider extends StatefulWidget {
  const homeslider({super.key, required this.images});
  final List<SliderModal> images;

  @override
  State<homeslider> createState() => _homesliderState();
}

class _homesliderState extends State<homeslider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [BuildSlider(), Gap(15), BuildIndicator()]);
  }

  SmoothPageIndicator BuildIndicator() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: currentIndex),
      count: widget.images.length,
      effect: ExpandingDotsEffect(
        dotColor: AppColors.borderColor,
        activeDotColor: AppColors.primaryColor,
        dotHeight: 7,
        dotWidth: 7,
        expansionFactor: 5,
      ),
      onDotClicked: (index) {},
    );
  }

  CarouselSlider BuildSlider() {
    return CarouselSlider.builder(
      itemCount: widget.images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              widget.images[itemIndex].image ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
      options: CarouselOptions(
        height: 150,
        viewportFraction: 1,
        initialPage: 0,
        autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
