import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/widgets/custom_network_image.dart'
    show CustomNetworkImage;

class ImageProfileAppBar extends StatelessWidget {
  const ImageProfileAppBar({super.key, this.imageUrl, this.widthAndHeight});
  final String? imageUrl;
  final double? widthAndHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAndHeight ?? 44,
      height: widthAndHeight ?? 44,
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.only(left: 2),
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 4),
        ),
      ),
      child: ClipOval(
        child: imageUrl == null
            ? Image.asset(Assets.imagesEllipse1,fit: BoxFit.cover)
            : CustomNetworkImage(
                imageUrl:
                    "https://supermarket-dan1.onrender.com/api/v1/${imageUrl!}",
              ),
      ),
    );
  }
}
