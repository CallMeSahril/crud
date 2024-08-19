import 'package:crud/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detailnote_controller.dart';

class DetailnoteView extends GetView<DetailnoteController> {
  const DetailnoteView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await _handleBackNavigation(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Note'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              bool shouldPop = await _handleBackNavigation(context);
              if (shouldPop) {
                Get.back();
              }
            },
          ),
          centerTitle: true,
        ),
        body: Obx(() =>
            controller.isLodiang.value ? const BuildLoading() : _buildContain()),
      ),
    );
  }

  Padding _buildContain() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: const InputDecoration(
              labelText: 'Judul',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.descriptionController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              controller.updateNote(controller.item!.id);
            },
            child: const Text('Selesai'),
          ),
        ],
      ),
    );
  }

  Future<bool> _handleBackNavigation(BuildContext context) async {
    String originalTitle = controller.item!.title;
    String originalDescription = controller.item!.description;

    String currentTitle = controller.titleController!.text.trim();
    String currentDescription = controller.descriptionController!.text.trim();

    if (originalTitle != currentTitle ||
        originalDescription != currentDescription) {
      return await _showExitConfirmationDialog(context);
    }
    return true;
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    bool shouldExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Perubahan Terdeteksi'),
        content: const Text(
            'Anda memiliki perubahan yang belum disimpan. Apakah Anda yakin ingin keluar tanpa menyimpan?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Tetap di sini'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Keluar tanpa menyimpan'),
          ),
          TextButton(
            onPressed: () {
              controller.updateNote(controller.item!.id);
              Get.back(result: true);
            },
            child: const Text('Simpan & Keluar'),
          ),
        ],
      ),
    );

    return shouldExit; // Pastikan nilai default jika null
  }
}
