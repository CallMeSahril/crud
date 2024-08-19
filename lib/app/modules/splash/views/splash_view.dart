import 'package:crud/app/core/theme/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  
  @override
  Widget build(BuildContext context) {
    controller.checkLoginStatus();
    return Scaffold(
      body: Center(
        child: Text(
          'CRUD',
          style: h6,
        ),
      ),
    );
  }
}
