import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  // 🔥 GET
  Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
    try {
      final response = await dio.get(url, queryParameters: query);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // 🔥 POST
  Future<dynamic> post(String url, {Map<String, dynamic>? bodyPerm}) async {
    try {
      final response = await dio.post(url, data: bodyPerm);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postMultipart(
    String url, {
    required FormData formData,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(headers: {"Accept": "*/*"}),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
