import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/api_error_handler.dart';

class ApiHandler {
  final dio = Dio();

  static final ApiHandler _instance = ApiHandler._internal();

  ApiHandler._internal() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log("🚀 Request: ${options.method} ${options.uri}");
        log("📤 Headers: ${options.headers}");
        log("📤 Data: ${options.data}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log("✅ Response (${response.statusCode}): ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        log("❌ DioException: ${e.type}");
        log("❌ Status Code: ${e.response?.statusCode}");
        log("❌ Error Message: ${e.message}");
        log("❌ Response Data: ${e.response?.data}");
        return handler.next(e);
      },
    ));
  }

  factory ApiHandler() {
    return _instance;
  }

  Future<Response> getHttp(
    String url, {
    String? contentType,
  }) async {
    try {
      Response response = await dio.get(url,
          options: Options(headers: await getHeader(contentType: contentType)));
      return response;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> postHttp(String url, var data, {String? contentType}) async {
    try {
      Response response = await dio.post(url,
          data: data,
          options: Options(headers: await getHeader(contentType: contentType)));
      return response;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> deleteHttp(String url, var data) async {
    try {
      Response response = await dio.delete(url,
          data: data, options: Options(headers: await getHeader()));
      return response;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Future<Response> patchHttp(String url, var data) async {
    try {
      Response response = await dio.patch(url,
          data: data, options: Options(headers: await getHeader()));
      return response;
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  Response _handleDioError(DioException e) {
    if (e.response != null) {
      throw ErrorHandler.handleResponse(e.response!);
    } else {
      throw Exception("Network Error: ${e.message}");
    }
  }

  Future<Map<String, dynamic>> getHeader({String? contentType}) async {
    Map<String, dynamic> header = {};
    header['Accept'] = "application/json";
    header['Content-Type'] = "application/json";
    return header;
  }
}
