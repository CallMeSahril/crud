import 'package:crud/app/data/entities/item_entities.dart';
import 'package:crud/app/data/repositories/item_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<ItemEntities>? listItem;
  var isLodiang = false.obs;
  final itemRepository = ItemRepository();

  @override
  void onInit() {
    getListItem();
    super.onInit();
  }

  getListItem() async {
    isLodiang.value = true;
    listItem = await itemRepository.getList();
    isLodiang.value = false;
  }

  deleteListByIndex(int id) async {
    bool result = await itemRepository.deleteItem(id);
    if (result) {
      getListItem();
      Get.snackbar("Berhasil", "Berhasil menghapus");
    } else {
      print(result);
    }
  }
}
