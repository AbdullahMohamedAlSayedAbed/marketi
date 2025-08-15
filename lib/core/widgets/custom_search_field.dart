import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/menu_search_field_widget.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: Align(
          alignment: Alignment.centerRight,
          child: MenuSearchFieldWidget()),
        prefixIcon: Icon(Icons.search, color: AppColors.darkPrimaryColor,size: 30,),
        hintStyle: AppStyles().style16w400.copyWith(
          color: AppColors.greyColor,
        ),
        hintText: 'What are you looking for ? ',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
  OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(width: 2, color: AppColors.lightGreyColor),
  );
}
}
