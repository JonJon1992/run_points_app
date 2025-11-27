import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:run_points_app/core/app.binding.dart';
import 'package:run_points_app/core/app.module.dart';

class RunPointApp extends GetView {
  const RunPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: AppModule().collectRoutes(),
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
