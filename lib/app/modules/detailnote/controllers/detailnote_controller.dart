import 'package:crud/app/data/entities/item_entities.dart';
import 'package:crud/app/data/repositories/item_repository.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailnoteController extends GetxController {
  var isLodiang = false.obs;
  ItemEntities? item;
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  final itemRepository = ItemRepository();

  @override
  void onInit() {
    super.onInit();
    // Mengambil item yang dikirim sebagai argumen
    print(Get.arguments);
    getListItem(Get.arguments);
  }

  getListItem(int id) async {
    isLodiang.value = true;
    item = await itemRepository.getItemById(id);
    print(item!.id);
    titleController = TextEditingController(text: item!.title);
    descriptionController = TextEditingController(text: item!.description);
    isLodiang.value = false;
  }

  // Fungsi untuk mengupdate item
  void updateNote(int id) async {
    String newTitle = titleController!.text.trim();
    String newDescription = descriptionController!.text.trim();

    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
      print(newTitle);
      print(newDescription);
      bool result = await itemRepository.updateItem(
          id: id, title: newTitle, description: newDescription);
      if (result) {
        Get.offAllNamed(Routes.HOME);
      }
    } else {
      Get.snackbar(
        'Error',
        'Judul dan Deskripsi tidak boleh kosong!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    titleController!.dispose();
    descriptionController!.dispose();
    super.onClose();
  }
}
