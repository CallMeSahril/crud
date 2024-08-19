import 'package:get/get.dart';
import 'package:crud/app/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  void logout() {
    _authController.logout();
  }
}
