import 'package:crud/app/core/theme/style.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:crud/app/widgets/input_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Center(
                    child: Text(
                      "Logo",
                      style: h6.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => InputTextField(
                      title: "Email",
                      controller: controller.emailController.value,
                      validator: controller.validateEmail,
                    )),
                SizedBox(height: 10),
                Obx(() => InputTextField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: controller.validatePassword,
                      obscureText: controller.isObscure.value,
                      controller: controller.passwordController.value,
                      title: "Password",
                      iconTextField: InkWell(
                        onTap: () {
                          controller.toggleObscure();
                        },
                        child: Icon(
                          controller.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.login();
                            } else {
                              if (kDebugMode) {
                                print("ini false");
                              }
                            }
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 100),
                          ),
                        ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tidak Punya Akun"),
                    TextButton(
                      child: Text("Register"),
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
