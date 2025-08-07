import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding paddingSymmetric({
    double? horizontalPadding,
    double? verticalPadding,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 0,
        vertical: verticalPadding ?? 0,
      ),
      child: this,
    );
  }

  Padding paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Padding paddingOnly({
    double? left = 0,
    double? top = 0,
    double? right = 0,
    double? bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }
}
