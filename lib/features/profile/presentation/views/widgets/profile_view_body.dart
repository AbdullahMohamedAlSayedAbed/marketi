import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/features/profile/presentation/views/widgets/logout_dialog.dart';
import 'package:marketi/features/profile/presentation/views/widgets/row_item_profile_widget.dart';
import 'package:marketi/features/profile/presentation/views/widgets/stack_data_user_profile_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  List<({IconData icon, void Function() onTap, String title})>
  RowItemProfileList(BuildContext context) => [
    (icon: Icons.person_2_outlined, title: 'Account Preferences', onTap: () {}),
    (
      icon: Icons.payment_outlined,
      title: 'Subscription & Payment',
      onTap: () {},
    ),
    (
      icon: Icons.notifications_active_outlined,
      title: 'App Notifications',
      onTap: () {},
    ),
    (icon: Icons.star_border_outlined, title: 'Rate Us', onTap: () {}),
    (icon: Icons.feedback_outlined, title: 'Provide Feedback', onTap: () {}),
    (
      icon: Icons.logout_outlined,
      title: 'Log Out',
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: const LogoutDialog(),
          ),
        );
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StackDataUserProfileView(),
          SizedBox(height: 30),
          ...List.generate(RowItemProfileList(context).length, (index) {
            return FadeInLeft(
              duration: const Duration(milliseconds: 500),
              delay: Duration(milliseconds: index * 100),
              child: RowItemProfileWidget(
                title: RowItemProfileList(context)[index].title,
                icon: RowItemProfileList(context)[index].icon,
                onTap: RowItemProfileList(context)[index].onTap,
              ),
            );
          }),
        ],
      ).paddingSymmetric(horizontalPadding: 22, verticalPadding: kTopPadding),
    );
  }
}
