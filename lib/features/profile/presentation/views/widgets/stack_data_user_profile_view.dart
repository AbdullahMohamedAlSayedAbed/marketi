import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/functions/get_user.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/profile/presentation/controllers/profile_image_cubit/profile_image_cubit_cubit.dart';
import 'package:marketi/features/profile/presentation/views/widgets/stack_image_profile_view.dart';

class StackDataUserProfileView extends StatelessWidget {
  const StackDataUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileImageCubitCubit>(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(Assets.imagesShapes),
          Column(
            children: [
              StackImageProfile(),
              Text(getUser().name!, style: AppStyles().style18w600),
              Text(getUser().email!, style: AppStyles().style14w400),
            ],
          ),
        ],
      ),
    );
  }
}
