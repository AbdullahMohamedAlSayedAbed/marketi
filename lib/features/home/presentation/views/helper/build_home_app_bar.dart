import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';

AppBar buildHomeAppBar(BuildContext context) {
    return AppBar(
      title: getUser().name == null
          ? const Text('Hi')
          : Text('Hi ${getUser().name}'),
      actions: [
        IconButton(
          icon: Badge(
            child: Icon(Icons.notifications, color: AppColors.primaryColor),
          ),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ],
      leading: InkWell(
        onTap: () {
          context.pushNamed(AppRouter.profile);
        },
        child: ImageProfileAppBar(),
      ),
    );
  }
