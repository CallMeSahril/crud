import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterController extends GetxController {
// Get instance of AuthController

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>().obs;
  var isObscure = true.obs;
  var isObscureTwo = true.obs;
  var isRegisterLoading = false.obs;

  // Inisialisasi FlutterSecureStorage
  final _secureStorage = const FlutterSecureStorage();

  // Fungsi untuk menghasilkan token acak
  String generateRandomToken(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rnd = Random();
    return List.generate(length, (index) => chars[rnd.nextInt(chars.length)])
        .join();
  }

  Future<void> register() async {
    if (formKey.value.currentState!.validate()) {
      isRegisterLoading.value = true;

      try {
        // Simulasi proses registrasi ke server
        await Future.delayed(const Duration(seconds: 2));

        // Hasilkan token acak dengan panjang 32 karakter
        String randomToken = generateRandomToken(32);

        // Simpan token, email, dan password ke dalam secure storage
        await _secureStorage.write(key: "auth_token", value: randomToken);
        await _secureStorage.write(key: "email", value: emailController.text);
        await _secureStorage.write(
            key: "password", value: passwordController.text);

        // Setelah berhasil register, arahkan pengguna ke halaman login
        Get.snackbar('Success', 'Pendaftaran berhasil',
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/login'); // Ganti dengan route ke halaman login
      } catch (e) {
        Get.snackbar('Error', 'Pendaftaran gagal: $e',
            snackPosition: SnackPosition.BOTTOM);
      } finally {
        isRegisterLoading.value = false;
      }
    } else {
      if (kDebugMode) {
        print("Validation failed");
      }
    }
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void toggleObscureTwo() {
    isObscureTwo.value = !isObscureTwo.value;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
