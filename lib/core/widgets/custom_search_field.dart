import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/menu_search_field_widget.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onSubmitted,
    this.onOrder,  this.isSearch =false,
  });
  final void Function(String)? onSubmitted;
  final void Function()? onOrder;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      onTap:isSearch? null:(){
        context.pushNamed(AppRouter.search);
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: InkWell(onTap: onOrder, child: MenuSearchFieldWidget()),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.darkPrimaryColor,
          size: 30,
        ),
        hintStyle: AppStyles().style16w400,
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
