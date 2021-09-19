import 'package:example/modules/books/presentation/controllers/books_home_controller.dart';
import 'package:get/get.dart';

class BooksHomeBinding extends Bindings {
  @override
  void dependencies() =>
      Get.create(() => BooksHomeController());
}