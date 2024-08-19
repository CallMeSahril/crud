import 'package:crud/app/data/entities/item_entities.dart';
import 'package:crud/app/modules/home/controllers/home_controller.dart';
import 'package:crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
        () => controller.isLodiang.value
            ? BuildLoading()
            : RefreshIndicator(
                onRefresh: _onRefresh,
                child: _buildContaint(result: controller.listItem),
              ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Catatan'),
      leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
          icon: Icon(Icons.person)),
      actions: [
        InkWell(
            onTap: () {
              Get.toNamed(Routes.ADDNOTE);
            },
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Icon(Icons.add)),
        SizedBox(width: 10),
      ],
      centerTitle: true,
    );
  }

  ListView _buildContaint({required List<ItemEntities>? result}) {
    return ListView.builder(
      itemCount: result!.length,
      itemBuilder: (context, index) {
        final item = result[index];
        return ListTile(
          onTap: () {
            Get.toNamed(Routes.DETAILNOTE, arguments: item.id);
          },
          title: Text(item.title),
          subtitle: Text(item.description),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.deleteListByIndex(item.id); // Delete item
            },
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() async {
    // Refresh data by calling the controller's method to fetch new data
    await controller.getListItem();
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
