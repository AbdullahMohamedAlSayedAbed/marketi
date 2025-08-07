import 'package:marketi/core/api/end_points.dart';

class ErrorModel {
  final String message;
  final int statusCode;
  ErrorModel({required this.message, required this.statusCode});

  factory ErrorModel.fromDioError(Map<String, dynamic> jsonData) {
    return ErrorModel(
      message: jsonData[ApiKeys.errorMessage],
      statusCode: jsonData[ApiKeys.status],
    );
  }
}
