import 'package:crud/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Icon(
              Icons.person,
              size: 100,
            ),
          ),
          CustomButton(
            onPressed: () {
              controller.logout();
            },
            title: 'Log Out',
          )
        ],
      ),
    );
  }
}
