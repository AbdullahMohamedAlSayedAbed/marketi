import 'package:flutter/material.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

AppBar buildAppBar({required String title}) {
    return AppBar(title:  Text(title),
    leading: ArrowBackIosWidget().paddingOnly(left: 8),
    centerTitle: true,
    actions: [
      ImageProfileAppBar().paddingOnly(right: 8),
    ],
    );
  }
