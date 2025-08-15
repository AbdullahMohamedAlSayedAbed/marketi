import 'package:flutter/material.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';
import 'package:marketi/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        leading: ImageProfileAppBar(),
      ),
      body: HomeViewBody(),
    );
  }
}
