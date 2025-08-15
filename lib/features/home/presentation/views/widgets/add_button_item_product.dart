import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class AddButtonItemProduct extends StatelessWidget {
  const AddButtonItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFF3F80FF)),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        'Add',
        textAlign: TextAlign.center,
        style: AppStyles().style14w500.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
