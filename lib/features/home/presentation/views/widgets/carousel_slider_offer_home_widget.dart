import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderOfferHomeWidget extends StatelessWidget {
  const CarouselSliderOfferHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Image.asset('assets/images/Offer_1.png'),
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
