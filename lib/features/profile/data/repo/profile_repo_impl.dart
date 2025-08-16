
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/core/functions/upload_image_to_api.dart';
import 'package:marketi/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiConsumer apiConsumer;

  ProfileRepoImpl({required this.apiConsumer});
  Future<Either<ServerException, String>> uploadProfileImage(
    XFile image,
  ) async {
    try {
      final file = await uploadImageToAPI(image);

      final formData = FormData.fromMap({"file": file});

      final response = await apiConsumer.post(
        EndPoints.addImage,
        data: formData,
        isFormDate: true,
      );
      log(response.toString());
      final imageUrl = response["data"]["image"] ?? response["image"];
      if (imageUrl == null) {
        return Left(
          ServerException(
            errorModel: ErrorModel(message: "Image is not uploaded", statusCode: 500),
        ));
      }
      return right(imageUrl.toString());
    } on ServerException catch (e) {
      log(e.toString());
      return Left(e);
    } catch (e) {
      log(e.toString());
      return Left(
        ServerException(
          errorModel: ErrorModel(message: e.toString(), statusCode: 500),
        ),
      );
    }
  }
}
