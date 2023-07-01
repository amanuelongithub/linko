import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktest_app/src/service/controller.dart';

class Global{
  static Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
    Get.put<MyController>(MyController());
  }
}