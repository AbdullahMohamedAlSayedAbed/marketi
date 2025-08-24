import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';

AppBar buildHomeAppBar(BuildContext context) {
  return AppBar(
    title: getUser().name == null
        ? FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: const Text('Hi'),
          )
        : FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Text('Hi ${getUser().name}'),
          ),
    actions: [
      FadeInRight(
        duration: const Duration(milliseconds: 600),
        child: IconButton(
          icon: Badge(
            child: Icon(Icons.notifications, color: AppColors.primaryColor),
          ),
          onPressed: () {
          },
        ),
      ),
    ],
    leading: FadeInLeft(
      duration: const Duration(milliseconds: 600),
      child: InkWell(
        onTap: () {
          context.pushNamed(AppRouter.profile);
        },
        child: ImageProfileAppBar(),
      ),
    ),
  );
}
