import 'package:crud/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/addnote_controller.dart';

class AddnoteView extends GetView<AddnoteController> {
  const AddnoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
        centerTitle: true,
      ),
      body: Obx(
          () => controller.isLodiang.value ? BuildLoading() : _buildContaint()),
    );
  }

  Padding _buildContaint() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controller.titleController,
            decoration: InputDecoration(
              labelText: 'Judul',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: controller.descriptionController,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              controller.addNote(); // Memanggil fungsi addNote
            },
            child: Text('Selesai'),
          ),
        ],
      ),
    );
  }
}
