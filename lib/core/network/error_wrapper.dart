import 'package:dio/dio.dart';
import 'package:nine_ja_hotel/core/common/app_strings.dart';
import '../app_logger.dart';
import 'error/error.dart';

class ApiError {
  int? errorType = 0;
  final logger = getLogger('ApiError');
  String? errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioException) {
      final DioException dioError = error;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = AppString.requestCancelled;
        case DioExceptionType.unknown:
          errorDescription = AppString.connectionFailed;
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionTimeout:
          errorDescription = AppString.connectionTimeout;
        case DioExceptionType.badResponse:
          errorType = dioError.response?.statusCode;
          errorDescription = handleErrorFromStatusCode(dioError.response);
        case DioExceptionType.badCertificate:
          break;
        case DioExceptionType.connectionError:
          errorDescription = AppString.connectionFailed;
      }
    } else {
      errorDescription = AppString.internalFailure;
    }
  }

  @override
  String toString() => '$errorDescription';

  String? handleErrorFromStatusCode(Response? response) {
    String message = '';

    switch (response?.statusCode) {
      case 401:
        message = AppString.sessionTimeout;
      case 400:
      case 402:
      case 403:
      case 404:
      case 409:
      case 412:
      case 422:
      case 500:
      case 405:
      case 429:
        message = ErrorData.fromJson(response?.data).message ?? '';
      case 503:
        message = AppString.serviceUnavailable;
      default:
        break;
    }

    return message;
  }
}
