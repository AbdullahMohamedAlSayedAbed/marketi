import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  const SizeOption({super.key, required this.size, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isSelected ? 1 : 0.5,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 48,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x193F80FF),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          size,
          style: AppStyles().style20w500.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
      ),
    );
  }
}
