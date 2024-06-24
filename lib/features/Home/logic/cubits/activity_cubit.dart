import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final Dio dio = Dio();
  ActivityCubit() : super(ActivityState.initial);
  List<dynamic> medications = [];
  Future<void> fetchMedications() async {
    emit(ActivityState.loading);
    try {
      final response =
          await dio.get('http://pharmaquick.runasp.net/api/Medications/GetAll');
      final medications =
          response.data; // Assuming the response is a list of medications
      emit(ActivityState.success);
      // You can emit medications here to pass it to UI
    } catch (e) {
      emit(ActivityState.error);
    }
  }
}
