import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class FormFieldForgetPassEmail extends StatelessWidget {
  const FormFieldForgetPassEmail({super.key, this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextSignUp(title: AppStrings.email),
        CustomTextFormField(
          prefixIcon: Icons.email,
          hintText: 'You@gmail.com',
          textInputType: TextInputType.emailAddress,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
