import 'package:get/get.dart';

import '../controllers/detailnote_controller.dart';

class DetailnoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailnoteController>(
      () => DetailnoteController(),
    );
  }
}
