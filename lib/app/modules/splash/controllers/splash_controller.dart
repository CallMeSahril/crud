import 'package:crud/app/controllers/auth_controller.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthController _authController =
      Get.find(); // Get instance of AuthController

  @override
  void onReady() {
    super.onReady();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    bool loggedIn = await _authController.isLoggedIn();

    if (loggedIn) {
      // Jika pengguna sudah login, arahkan ke halaman home
      Get.offAllNamed(Routes.HOME);
    } else {
      // Jika pengguna belum login, arahkan ke halaman login
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
