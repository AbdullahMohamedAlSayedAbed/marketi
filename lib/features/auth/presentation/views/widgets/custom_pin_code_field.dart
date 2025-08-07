import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onCompleted;

  const CustomPinCodeField({
    super.key,
    required this.controller,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      mainAxisAlignment: MainAxisAlignment.center,
      length: 4,
      autoDisposeControllers: false,
      obscureText: false,
      animationType: AnimationType.none,
      keyboardType: TextInputType.number,
      cursorColor: Colors.blue,

      textStyle: const TextStyle(fontSize: 20),
      pinTheme: PinTheme(
        fieldHeight: 60,
        fieldWidth: 60,
        borderWidth: 2,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        inactiveColor: AppColors.lightBlueColor,
        selectedColor: AppColors.lightBlueColor,
        activeColor: AppColors.lightBlueColor,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        activeFillColor: Colors.transparent,
      ),
      enableActiveFill: true,
      onCompleted: onCompleted,
      
      onChanged: (value) {},
    );
  }
}
