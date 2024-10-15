import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  Future<Response> getRequest(
      {required String baseUrl,
      required String endPoint,
      @required String? token,
      @required String? contentType,
      Map<String, dynamic>? headersInput}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(
        contentType: contentType,
        headers: headersInput ?? headers,
      ),
    );
    return response;
  }

  Future<Response> postRequest({
    required String baseUrl,
    required String endPoint,
    @required String? token,
    @required String? contentType,
    @required Map<String, String>? body,
    Map<String, dynamic>? headersInput,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: body,
      options: Options(
        contentType: contentType,
        headers: headersInput ?? headers,
      ),
    );
    return response;
  }
}
