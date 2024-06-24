import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_application_2/features/Home/model/informations.dart';

class MedicineDataApiService {
  static Future<List<MedicineModel>> getAllMedicines() async {
    String url = 'http://pharmaquick1.runasp.net/api/Medications/GetAll';

    try {
      final Dio _dio = Dio();

      Response response = await _dio.get(url);

      List<dynamic> responseData = response.data;
      List<MedicineModel> medicineData =
          responseData.map((data) => MedicineModel.fromJson(data)).toList();

      return medicineData;
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404)
          throw Exception('Medicine not found');
        else if (e.response?.statusCode == 500)
          throw Exception('Internal server error');
        else
          throw Exception('Response error');
      } else {
        throw Exception('Unexpected error');
      }
    }
  }

  static Future<String> getInteraction(
    String name1,
    String name2,
  ) async {
    String url = 'http://pharmaquick1.runasp.net/api/Interactions/interactions';
    List<String> medcines = [name1, name2];
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "text/plain"
    };

    try {
      final Dio _dio = Dio();

      Response response = await _dio.post(url,
          data: medcines, options: Options(headers: headers));

      String responseData = response.data;
      Map<String, dynamic> res = jsonDecode(responseData);

      return res['message'];
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404)
          throw Exception('Interaction not found');
        else if (e.response?.statusCode == 500)
          throw Exception('Internal server error');
        else
          throw Exception('Response error');
      } else {
        throw Exception('Unexpected error');
      }
    }
  }

  static Future<MedicineModel> getOnlyMedicines(
      {required String medicine}) async {
    String url = 'http://pharmaquick1.runasp.net/api/Medications/$medicine';

    try {
      final Dio _dio = Dio();

      Response response = await _dio.get(url);

      Map<String, dynamic> responseData = response.data;
      MedicineModel medicineData = MedicineModel.fromJson(responseData);

      return medicineData;
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404)
          throw Exception('Medicine not found');
        else if (e.response?.statusCode == 500)
          throw Exception('Internal server error');
        else
          throw Exception('Response error');
      } else {
        throw Exception('Unexpected error');
      }
    }
  }
}
