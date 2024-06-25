import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/features/Home/model/informations.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MedicineModel>>> fetchNewProducts();
}
