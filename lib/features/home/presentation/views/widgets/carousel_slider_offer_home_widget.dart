import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_images.dart';

class CarouselSliderOfferHomeWidget extends StatelessWidget {
  const CarouselSliderOfferHomeWidget({super.key});
  List<String> get imagesOffer => [
    Assets.imagesOffer1,
    Assets.imagesOffer2,
    Assets.imagesOffer3,
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagesOffer.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Image.asset(imagesOffer[index]),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 374 / 120,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        enlargeCenterPage: true,
      ),
    );
  }
}
