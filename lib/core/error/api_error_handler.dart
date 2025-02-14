import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ErrorHandler {
  static Response handleResponse(Response response) {
    log("handleResponse: ${response.statusCode}");
    log("handleResponse: ${response.data}");
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
      case 401:
      case 403:
      case 404:
      case 405:
      case 422:
      case 500:
      case 503:

        if(response.data is Map<String, dynamic>) {
          throw CustomException(response: response.data as Map<String, dynamic>,
              statusCode: response.statusCode);
        }else {
          throw CustomException(response: jsonDecode(response.data.toString()),
              statusCode: response.statusCode);
        }
      default:
        if(response.data is Map<String, dynamic>) {
          throw CustomException(response: response.data as Map<String, dynamic>,
              statusCode: response.statusCode);
        }else {
          throw CustomException(response: jsonDecode(response.data.toString()),
              statusCode: response.statusCode);
        }
    }
  }
  static CustomException handleDioException(DioException e) {
    String message = "Something went wrong";
    int? statusCode;
    Map<String, dynamic>? responseData;

    if (e.response != null) {
      statusCode = e.response?.statusCode;
      responseData = _parseResponse(e.response!);
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection Timeout. Please check your network.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Request Timeout. Please try again.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Server took too long to respond.";
        break;
      case DioExceptionType.badResponse:
        message = "Bad response from server.";
        break;
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection. Please check your network.";
        break;
      case DioExceptionType.unknown:
      default:
        message = e.message ?? "Unexpected error occurred.";
        break;
    }

    return CustomException(
      statusCode: statusCode,
      response: responseData,
    );
  }
  static Map<String, dynamic>? _parseResponse(Response response) {
    try {
      return response.data is String ? jsonDecode(response.data) : response.data;
    } catch (e) {
      log("Error parsing response: $e");
      return {"error": "Invalid response format"};
    }
  }
}

class CustomException implements Exception {
  Map<String, dynamic>? response;
  int? statusCode;

  CustomException({this.response, this.statusCode});
}


