import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/profile/presentation/controllers/profile_image_cubit/profile_image_cubit_cubit.dart';
import 'package:marketi/features/profile/presentation/views/widgets/stack_image_profile_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackDataUserProfileView extends StatelessWidget {
  const StackDataUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileImageCubitCubit>(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 600),
            child: SvgPicture.asset(Assets.imagesShapes),
          ),
          Column(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 700),
                child: const StackImageProfile(),
              ),
              const SizedBox(height: 8),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: Text(getUser().name!, style: AppStyles().style18w600),
              ),
              const SizedBox(height: 4),
              FadeInUp(
                duration: const Duration(milliseconds: 900),
                child: Text(getUser().email!, style: AppStyles().style14w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
