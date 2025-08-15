import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class MenuSearchFieldWidget extends StatelessWidget {
  const MenuSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(2),
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        strokeAlign: BorderSide.strokeAlignOutside,
        color: AppColors.lightGreyColor,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Icon(Icons.menu, color: AppColors.primaryColor),
);
  }
}
