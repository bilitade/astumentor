import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import '../Model/user.dart';

class AuthService {
  final _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.137.1/api',
    //connectTimeout: 5000,
    // receiveTimeout: 3000,
  ));
  static register({
    required name,
    required email,
    required password,
    required cnpass,
    required devicename,
  }) async {
    Map<String, String> _data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': cnpass,
      'device_name': devicename
    };
  }

  Future<Object?> login({
    required email,
    required password,
    required devicename,
  }) async {
    Map<String, String> _data = {
      'email': email,
      'password': password,
      'device_name': devicename
    };
    try {
      Response response = await _dio.post("/login", data: jsonEncode(_data));
      if (response.statusCode == 200) {
        var user = User.fromJson(response.data);
        return user;
      }
    } on DioError catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
