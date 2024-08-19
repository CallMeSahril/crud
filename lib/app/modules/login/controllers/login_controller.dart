import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:crud/app/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final AuthController _authController =
      Get.find(); // Get instance of AuthController

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isObscure = true.obs;

  var isLoading = false.obs;
  var loginErrorMessage = ''.obs;

  final AuthController authController = Get.find<AuthController>();

  Future<void> login() async {
    isLoading.value = true;
    loginErrorMessage.value = '';

    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();

    print('Input Email: $email');
    print('Input Password: $password');

    try {
      // Cek email yang tersimpan
      String? storedEmail = (await authController.getEmail())?.trim();
      String? storedPassword = (await authController.getPassword())?.trim();

      print('Stored Email: $storedEmail');
      print('Stored Password: $storedPassword');

      // Validasi login
      if (storedEmail == email && storedPassword == password) {
        await _authController.setLoggedIn(true); // Tandai pengguna sebagai login
        Get.offAllNamed('/home'); // Ganti dengan route ke halaman home
      } else {
        loginErrorMessage.value = 'Email atau Password salah!';
        Get.snackbar('Error', loginErrorMessage.value);
      }
    } catch (e) {
      loginErrorMessage.value = 'Terjadi kesalahan: $e';
      Get.snackbar('Error', loginErrorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email lengkap harus diisi';
    }

    if (!value.contains('@')) {
      return 'Email harus mengandung @';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    } else if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // Tidak perlu memanggil dispose() secara manual pada TextEditingController
}
