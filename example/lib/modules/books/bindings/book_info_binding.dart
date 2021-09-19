import 'package:example/modules/books/presentation/controllers/book_info_controller.dart';
import 'package:get/get.dart';

class BookInfoBinding extends Bindings {
  @override
  void dependencies() =>
    Get.create(() => BookInfoController(Get.parameters["bookId"] ?? ""));
}