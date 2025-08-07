import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';


class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      prefixIcon:  Icons.lock_outline,
      suffixIcon: IconButton(
        onPressed: () {
          obscureText = !obscureText;
          setState(() {});
        },
        icon:
            obscureText
                ? const Icon(Icons.remove_red_eye, color: AppColors.darkPrimaryColor)
                : const Icon(Icons.visibility_off, color: AppColors.darkPrimaryColor),
      ),
      hintText: AppStrings.password,
      textInputType: TextInputType.visiblePassword,
    );
  }
}
