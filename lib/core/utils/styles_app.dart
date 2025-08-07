import 'package:flutter/material.dart';

class AppStyles {
  static final AppStyles _instance = AppStyles._internal();

  factory AppStyles() => _instance;

  AppStyles._internal();

  TextStyle get style14w400 =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  TextStyle get style12w500 =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  TextStyle get style14w500 =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  TextStyle get style16w500 =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get style18w500 =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  TextStyle get style20w500 =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  TextStyle get style22w500 =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w500);

  TextStyle get style24w500 =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w500);

  TextStyle get style28w500 =>
      const TextStyle(fontSize: 28, fontWeight: FontWeight.w500);

  TextStyle get style32w500 =>
      const TextStyle(fontSize: 32, fontWeight: FontWeight.w500);

  TextStyle get style18w600 =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  TextStyle get style16w600 =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  TextStyle get style20w600 =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  TextStyle get style12w400 =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

  TextStyle get style16w400 =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  TextStyle get style14w600 =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  TextStyle get style12w500U => const TextStyle(
    fontSize: 12,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
    height: 16.32 / 12,
  );

  TextStyle get style10w600 =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}
