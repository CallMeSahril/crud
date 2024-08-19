import 'package:crud/app/routes/app_pages.dart';
import 'package:crud/app/widgets/custom_button.dart';
import 'package:crud/app/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: controller.nameController,
                    title: "Input Name",
                    iconTextField: Icon(Icons.person),
                    validator: controller.validateName,
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    controller: controller.emailController,
                    title: "Input Email",
                    iconTextField: Icon(Icons.email),
                    validator: controller.validateEmail,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => InputTextField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: controller.validatePassword,
                        obscureText: controller.isObscure.value,
                        controller: controller.passwordController,
                        title: "Input Password",
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
                  const SizedBox(height: 20),
                  Obx(() => controller.isRegisterLoading.value
                      ? CircularProgressIndicator()
                      : CustomButton(
                        title: "Register",
                          onPressed: () {
                            controller.register();
                          },
                        )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
