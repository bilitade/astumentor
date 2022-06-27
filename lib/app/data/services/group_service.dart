import 'dart:developer';

import 'package:astumentor/app/data/Model/ApiResponse.dart';
import 'dart:convert';
import 'dart:io';
import '../config.dart';
import '../Model/group.dart';
import '../services/auth_service.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> mygroup() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(mGroupURL), headers: {
      'Accept': 'application/json',
      'Connection': "keep-alive",
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['groups']
            .map((p) => Group.fromJson(p))
            .toList();
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> otherGroup() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(otherGroupURL), headers: {
      'Accept': 'application/json',
      'Connection': "keep-alive",
      'Authorization': 'Bearer $token'
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['groups']
            .map((p) => Group.fromJson(p))
            .toList();
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
