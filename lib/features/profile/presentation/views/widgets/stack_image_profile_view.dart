import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';
import 'package:marketi/features/profile/presentation/controllers/profile_image_cubit/profile_image_cubit_cubit.dart';

class StackImageProfile extends StatelessWidget {
  const StackImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileImageCubitCubit, ProfileImageCubitState>(
      listener: (context, state) {
          if (state is ProfileImageUploaded) {
          showCustomToast(message: state.message, type: ToastType.success);
        } else if (state is ProfileImageError) {
          showCustomToast(message: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
         final cubit = context.read<ProfileImageCubitCubit>();
        return InkWell(
          onTap: ()async {
            await cubit.pickImage();
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ImageProfileAppBar(widthAndHeight: 116.0,imageUrl: cubit.uploadedImageUrl,),
              Container(
                width: 24,
                height: 24,
                decoration: ShapeDecoration(
                  color: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
