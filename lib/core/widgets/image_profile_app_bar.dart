import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/widgets/custom_network_image.dart'
    show CustomNetworkImage;

class ImageProfileAppBar extends StatelessWidget {
  const ImageProfileAppBar({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 4),
        ),
      ),
      child: ClipOval(
        child: imageUrl == null
            ? SvgPicture.asset(
                Assets.imagesEllipse1,
                // fit: BoxFit.cover,
              )
            : CustomNetworkImage(imageUrl: imageUrl!),
      ),
    );
  }
}
