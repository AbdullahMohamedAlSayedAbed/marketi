
import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/features/profile/presentation/views/widgets/custom_app_bar_profile_and_details.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarProfileAndDetails(
        title: 'My Profile',
        onPressed: () {
          context.pushNamed(AppRouter.cart);
        },
      ),
      body: SafeArea(child: ProfileViewBody()),
    );
  }

}
  