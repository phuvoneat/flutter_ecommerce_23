import 'dart:io';

import 'package:dio/dio.dart';

class APIProvider {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://192.168.0.101:8000/api",
    contentType: 'application/json',
    responseType: ResponseType.json,
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  Future<Response> signUp(
      {required String email,
      required String password,
      required String confirmPass,
      required String name,
      File? image}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
        'name': name,
        'password_confirmation': confirmPass,
        'avatar':
            image != null ? await MultipartFile.fromFile(image.path) : null
      });
      return await dio.post(
        '/register',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login(
      {required String email, required String password}) async {
    try {
      final formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      return await dio.post(
        '/login',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
