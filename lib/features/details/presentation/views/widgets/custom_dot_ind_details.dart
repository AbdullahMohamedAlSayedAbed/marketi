import 'package:flutter/material.dart';

class CustomDotIndDetails extends StatelessWidget {
  const CustomDotIndDetails({super.key, required this.isActive });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 3),
      width:isActive? 40:5,
      height:isActive? 4:5,
      decoration: ShapeDecoration(
        color: const Color(0xFF002B7F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
