import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/profile/presentation/views/widgets/arrow_select.dart';

class RowItemProfileWidget extends StatelessWidget {
  const RowItemProfileWidget({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });

  final IconData? icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            spacing: 16,
            children: [
              Icon(icon, size: 22, color: AppColors.darkPrimaryColor),
              Text(
                title,
                style: AppStyles().style16w500.copyWith(
                      color: AppColors.darkPrimaryColor,
                    ),
              ),
              const Spacer(),
              const ArrowSelect(),
            ],
          ),
          const Divider(
            height: 25,
            indent: 7,
            endIndent: 7,
            thickness: 1,
            color: Color(0xFFDCDDDF),
          ),
        ],
      ),
    );
  }
}

