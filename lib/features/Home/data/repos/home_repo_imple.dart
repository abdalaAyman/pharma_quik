import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final APIService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MedicineModel>>> fetchNewProducts() async {
    try {
      var data = await apiService.getMethod(endPoint: 'showAllProduct.php');

      List<MedicineModel> products = [];
      for (var item in data['data']) {
        products.add(MedicineModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioExceptionError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
