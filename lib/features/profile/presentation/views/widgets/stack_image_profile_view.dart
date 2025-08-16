import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';

class StackImageProfileView extends StatelessWidget {
  const StackImageProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(Assets.imagesShapes),
        Column(
          children: [
            ImageProfileAppBar(widthAndHeight: 116.0),
            Text(getUser().name!, style: AppStyles().style18w600),
            Text(getUser().email!, style: AppStyles().style14w400),
          ],
        ),
      ],
    );
  }
}
