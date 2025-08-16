import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/error/server_exception.dart';

abstract class ProfileRepo {
  Future<Either<ServerException, String>> uploadProfileImage(XFile image);
}
