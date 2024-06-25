import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'pharma_quik.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('favorites');
  runApp(PharmaQuik(
    appRouter: AppRouter(),
  ));
}
