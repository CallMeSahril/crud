import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // ignore: prefer_const_constructors
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _secureStorage.write(
        key: 'isLoggedIn', value: isLoggedIn ? 'true' : 'false');
  }

  Future<String?> getPassword() async {
    try {
      String? password = await _secureStorage.read(key: 'password');
      return password;
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving password: $e');
      }
      return null;
    }
  }

  Future<String?> getEmail() async {
    try {
      String? email = await _secureStorage.read(key: 'email');
      return email;
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving email: $e');
      }
      return null;
    }
  }

  Future<void> register(String username, String password) async {
    await _secureStorage.write(key: 'username', value: username);
    await _secureStorage.write(key: 'password', value: password);
    await _secureStorage.write(key: 'isLoggedIn', value: 'true');
    Get.offAllNamed('/home');
  }

  Future<void> login(String email, String password) async {
    String? storedEmail = await _secureStorage.read(key: 'email');
    String? storedPassword = await _secureStorage.read(key: 'password');

    if (kDebugMode) {
      print('Input Email: $email');
    }
    if (kDebugMode) {
      print('Input Password: $password');
    }
    if (kDebugMode) {
      print('Stored Email: $storedEmail');
    }
    if (kDebugMode) {
      print('Stored Password: $storedPassword');
    }

    if (storedEmail == email && storedPassword == password) {
      await _secureStorage.write(key: 'isLoggedIn', value: 'true');
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Email atau Password salah!',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Method untuk logout pengguna
  Future<void> logout() async {
    await _secureStorage.delete(key: 'isLoggedIn');
    Get.offAllNamed('/login');
  }

  Future<bool> isLoggedIn() async {
    String? isLoggedIn = await _secureStorage.read(key: 'isLoggedIn');
    return isLoggedIn == 'true';
  }
}
