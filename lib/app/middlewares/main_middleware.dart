import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainMiddleware extends GetMiddleware {
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    final token = box.read('token');
    if (token != null) {
      return null;
    }
    return const RouteSettings(name: Routes.LOGIN);
  }
}
