import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nine_ja_hotel/core/session_manager.dart';
import '../app_logger.dart';
import 'error_wrapper.dart';

enum RequestType { post, get, put, delete, upload, patch }

class NetworkService {
  static const int connectTimeout = 500000;
  static const int receiveTimeout = 500000;
  Dio? dio;

  NetworkService();

  NetworkService.internal({required this.dio});

  final logger = getLogger('NetworkService');

  Future<Response> request({
    required String path,
    required RequestType requestType,
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    Options? options,
    classTag = '',
    void Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    Response response;
    final params = queryParams ?? {};
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    try {
      switch (requestType) {
        case RequestType.post:
          response = await dio!.post(
            path,
            queryParameters: params,
            data: data,
            cancelToken: cancelToken,
            options: options ?? await _getOption(),
            onSendProgress: onSendProgress,
          );

        case RequestType.get:
          response = await dio!.get(
            path,
            queryParameters: params,
            cancelToken: cancelToken,
            options: options ?? await _getOption(),
          );

        case RequestType.put:
          response = await dio!.put(
            path,
            queryParameters: params,
            data: data,
            cancelToken: cancelToken,
            options: options ?? await _getOption(),
            onSendProgress: onSendProgress,
          );

        case RequestType.patch:
          response = await dio!.patch(
            path,
            queryParameters: params,
            data: data,
            cancelToken: cancelToken,
            options: options ?? await _getOption(),
            onSendProgress: onSendProgress,
          );

        case RequestType.delete:
          response = await dio!.delete(
            path,
            queryParameters: params,
            data: data,
            cancelToken: cancelToken,
            options: options ?? await _getOption(),
          );

        case RequestType.upload:
          response = await dio!.post(
            path,
            data: formData,
            queryParameters: params,
            cancelToken: cancelToken,
            options: options ?? await _getOption(upload: true),
            onSendProgress: onSendProgress,
          );
      }

      return response;
    } catch (error, stackTrace) {
      final apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // PageNavigator.replace(SigninRoute());
      }

      return Future.error(apiError, stackTrace);
    }
  }

  Future<Options> _getOption({bool upload = false}) async => Options(
    responseType: ResponseType.json,
    followRedirects: false,
    receiveTimeout: const Duration(minutes: NetworkService.receiveTimeout),
    headers: {
      'Content-Type': 'application/json',
      if (session.accessToken.isNotEmpty)
        'Authorization': 'Bearer ${session.accessToken}',
    },
  );
}
