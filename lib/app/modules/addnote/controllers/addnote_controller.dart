import 'package:crud/app/data/repositories/item_repository.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddnoteController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var isLodiang = false.obs;

  void addNote() async {
    isLodiang.value = true;
    final String title = titleController.text.trim();
    final String description = descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      final itemRepository = ItemRepository();

      bool result = await itemRepository.createItem(title, description);
      print(result);
      if (result) {
        Get.snackbar("Berhasil", "Berhasil menambahkan note");

        Get.offAllNamed(Routes.HOME);
      } else {}
    } else {
      Get.snackbar("Error", "Judul dan Deskripsi tidak boleh kosong.");
    }
    isLodiang.value = false;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
