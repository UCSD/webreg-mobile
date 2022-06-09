// ignore_for_file: always_specify_types

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';

class NetworkHelper {
  const NetworkHelper();

  static const int SSO_REFRESH_MAX_RETRIES = 3;
  static const int SSO_REFRESH_RETRY_INCREMENT = 5000;
  static const int SSO_REFRESH_RETRY_MULTIPLIER = 3;

  Future<dynamic> fetchData(String url) async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.plain;
    final Response _response = await dio.get(url);

    if (_response.statusCode == 200) {
      // If server returns an OK response, return the body
      return _response.data;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to fetch data: ' + _response.data);
    }
  }

  Future<dynamic> authorizedFetch(
      String url, Map<String, String> headers) async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.plain;
    dio.options.headers = headers;
    final Response _response = await dio.get(
      url,
    );
    if (_response.statusCode == 200) {
      // If server returns an OK response, return the body
      return _response.data;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to fetch data: ' + _response.data);
    }
  }

  Future<dynamic> authorizedPost(
      String url, Map<String, String>? headers, dynamic body) async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    final Response _response = await dio.post(url, data: body);
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      // If server returns an OK response, return the body
      return _response.data;
    } else if (_response.statusCode == 400) {
      // If that response was not OK, throw an error.
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 401) {
      throw Exception(ErrorConstants.authorizedPostErrors +
          ErrorConstants.invalidBearerToken);
    } else if (_response.statusCode == 404) {
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 500) {
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 409) {
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.duplicateRecord + message);
    } else {
      throw Exception(ErrorConstants.authorizedPostErrors + 'unknown error');
    }
  }

  Future<dynamic> authorizedPut(
      String url, Map<String, String> headers, dynamic body) async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    final Response _response = await dio.put(url, data: body);

    if (_response.statusCode == 200 || _response.statusCode == 201) {
      // If server returns an OK response, return the body
      return _response.data;
    } else if (_response.statusCode == 400) {
      // If that response was not OK, throw an error.
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else if (_response.statusCode == 401) {
      throw Exception(ErrorConstants.authorizedPutErrors +
          ErrorConstants.invalidBearerToken);
    } else if (_response.statusCode == 404) {
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else if (_response.statusCode == 500) {
      final String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else {
      throw Exception(ErrorConstants.authorizedPutErrors + 'unknown error');
    }
  }

  Future<dynamic> authorizedDelete(
      String url, Map<String, String> headers) async {
    final Dio dio = Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    try {
      final Response _response = await dio.delete(url);
      if (_response.statusCode == 200) {
        // If server returns an OK response, return the body
        return _response.data;
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to delete data: ' + _response.data);
      }
    } on TimeoutException {
      // Display an alert - i.e. no internet
    } catch (err) {
      return null;
    }
  }
}
