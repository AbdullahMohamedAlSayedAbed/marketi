import 'package:flutter/material.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/features/onboarding/views/widgets/custom_dot_indicator.dart';

class ListGenerateDotIndicator extends StatelessWidget {
  const ListGenerateDotIndicator({
    super.key,
    required this.length,
    required this.currentPage,
  });

  final int length;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (dotIndex) {
        return CustomDotIndicator(
          isActive: dotIndex == currentPage,
        ).paddingSymmetric(horizontalPadding: 4.0);
      }),
    );
  }
}
