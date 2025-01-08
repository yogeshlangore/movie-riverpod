import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/utils/constant.dart';

class DioClient {
  late Dio _dio;
  DioClient() {
    _dio = Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)));
  }

  Future<Response> get(String urlEndpoint) async {
    final url = apiUrl + urlEndpoint;
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioProvider = Provider((ref) => DioClient());