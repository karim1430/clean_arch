import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final String paseUrl = 'https://www.googleapis.com/books/v1/';
  //https://www.googleapis.com/books/v1/volumes?q=search+terms(programming)

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$paseUrl$endPoint");

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(
      "$paseUrl$endPoint",
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.put(
      "$paseUrl$endPoint",
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await _dio.delete("$paseUrl$endPoint");
    return response.data;
  }
}
