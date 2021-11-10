import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreg_mobile_flutter/app_constants.dart';
import 'package:webreg_mobile_flutter/app_styles.dart';

class NetworkHelper {
  ///TODO: inside each service that file place a switch statement to handle all
  ///TODO: different errors thrown by the Dio client DioErrorType.RESPONSE
  const NetworkHelper();

  static const int SSO_REFRESH_MAX_RETRIES = 3;
  static const int SSO_REFRESH_RETRY_INCREMENT = 5000;
  static const int SSO_REFRESH_RETRY_MULTIPLIER = 3;

  Future<dynamic> fetchData(String url) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.plain;
    final _response = await dio.get(url);

    if (_response.statusCode == 200) {
      // If server returns an OK response, return the body
      return _response.data;
    } else {
      ///TODO: log this as a bug because the response was bad
      // If that response was not OK, throw an error.
      throw Exception('Failed to fetch data: ' + _response.data);
    }
  }

  Future<dynamic> authorizedFetch(
      String url, Map<String, String> headers) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.responseType = ResponseType.plain;
    dio.options.headers = headers;
    final _response = await dio.get(
      url,
    );
    if (_response.statusCode == 200) {
      // If server returns an OK response, return the body
      return _response.data;
    } else {
      ///TODO: log this as a bug because the response was bad
      // If that response was not OK, throw an error.

      throw Exception('Failed to fetch data: ' + _response.data);
    }
  }

  // Widget getSilentLoginDialog() {
  //   return AlertDialog(
  //     title: const Text(LoginConstants.silentLoginFailedTitle),
  //     content: Text(LoginConstants.silentLoginFailedDesc),
  //     actions: [
  //       TextButton(
  //         style: TextButton.styleFrom(
  //           primary: ucLabelColor,
  //         ),
  //         onPressed: () {
  //           Get.back(closeOverlays: true);
  //         },
  //         child: const Text('OK'),
  //       ),
  //     ],
  //   );
  // }

  Future<dynamic> authorizedPost(
      String url, Map<String, String>? headers, dynamic body) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    final _response = await dio.post(url, data: body);
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      // If server returns an OK response, return the body
      return _response.data;
    } else if (_response.statusCode == 400) {
      // If that response was not OK, throw an error.
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 401) {
      throw Exception(ErrorConstants.authorizedPostErrors +
          ErrorConstants.invalidBearerToken);
    } else if (_response.statusCode == 404) {
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 500) {
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPostErrors + message);
    } else if (_response.statusCode == 409) {
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.duplicateRecord + message);
    } else {
      throw Exception(ErrorConstants.authorizedPostErrors + 'unknown error');
    }
  }

  Future<dynamic> authorizedPut(
      String url, Map<String, String> headers, dynamic body) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    final _response = await dio.put(url, data: body);

    if (_response.statusCode == 200 || _response.statusCode == 201) {
      // If server returns an OK response, return the body
      return _response.data;
    } else if (_response.statusCode == 400) {
      // If that response was not OK, throw an error.
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else if (_response.statusCode == 401) {
      throw Exception(ErrorConstants.authorizedPutErrors +
          ErrorConstants.invalidBearerToken);
    } else if (_response.statusCode == 404) {
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else if (_response.statusCode == 500) {
      String message = _response.data['message'] ?? '';
      throw Exception(ErrorConstants.authorizedPutErrors + message);
    } else {
      throw Exception(ErrorConstants.authorizedPutErrors + 'unknown error');
    }
  }

  Future<dynamic> authorizedDelete(
      String url, Map<String, String> headers) async {
    Dio dio = new Dio();
    dio.options.connectTimeout = 20000;
    dio.options.receiveTimeout = 20000;
    dio.options.headers = headers;
    try {
      final _response = await dio.delete(url);
      if (_response.statusCode == 200) {
        // If server returns an OK response, return the body
        return _response.data;
      } else {
        ///TODO: log this as a bug because the response was bad
        // If that response was not OK, throw an error.
        throw Exception('Failed to delete data: ' + _response.data);
      }
    } on TimeoutException catch (e) {
      // Display an alert - i.e. no internet
      print(e);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
