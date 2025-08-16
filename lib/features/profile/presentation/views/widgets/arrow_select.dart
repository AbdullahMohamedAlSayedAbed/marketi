import 'dart:math';
import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class ArrowSelect extends StatelessWidget {
  const ArrowSelect({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: ShapeDecoration(
            color: const Color(0xFFF4FAFF) ,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.46,
                color: AppColors.lightGreyColor
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Transform.rotate(
              angle: pi,
              child: Icon(Icons.arrow_back_ios)),
          ),
        ),
      ],
    );
  }
}
