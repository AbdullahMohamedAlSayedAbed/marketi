
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/features/profile/presentation/views/widgets/custom_app_bar_profile_and_details.dart';
import 'package:marketi/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarProfileAndDetails(
        title: 'My Profile',
      ),
      body: SafeArea(child: ProfileViewBody()),
    );
  }

}
  