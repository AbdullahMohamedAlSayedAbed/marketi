import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

AppBar customAppBarProfileAndDetails({required String title}) {
    return AppBar(
      leading: ArrowBackIosWidget(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            count: 3,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              CupertinoIcons.shopping_cart,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles().style20w600.copyWith(
          color: AppColors.darkPrimaryColor,
        ),
      ),
    );
  }
