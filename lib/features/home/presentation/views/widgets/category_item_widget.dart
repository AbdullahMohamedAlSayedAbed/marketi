import 'package:flutter/material.dart';
import 'package:marketi/core/utils/styles_app.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: const Color(0xB2B2CCFF) /* rect */,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x0A3F80FF),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Image.asset('assets/images/Smart_Watch.png'),
        ),
        Text("Category", style: AppStyles().style16w500),
      ],
    );
  }
}
