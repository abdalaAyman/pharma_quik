import 'dart:convert';

import 'package:dio/dio.dart';

class APIService {
  final _url = 'http://pharmaquick.runasp.net/api/Medications/GetAll';

  final Dio dio;

  APIService(this.dio);

  Future<Map<String, dynamic>> getMethod({required String endPoint}) async {
    var response = await dio.get(
      _url + endPoint,
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    var result = json.decode(response.data);
    return result;
  }
}
