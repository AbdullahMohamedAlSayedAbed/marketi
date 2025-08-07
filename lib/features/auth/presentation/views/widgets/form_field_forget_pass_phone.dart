import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class FormFieldForgetPassPhone extends StatelessWidget {
  const FormFieldForgetPassPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextSignUp(title: AppStrings.phoneNumber),
        CustomTextFormField(
          prefixIcon: Icons.phone,
          hintText: '+20 1501142409',
          textInputType: TextInputType.phone,
        ),
      ],
    );
  }
}
