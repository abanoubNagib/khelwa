import 'package:dio/dio.dart';

import '../errors/api_error_model.dart';

enum DataSource {
  noContent,
}

class ResponseCode {}

class ResponseMessage {}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    return ApiErrorModel(message: 'message');
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  return ApiErrorModel(message: 'message');
}
