import 'package:architecture_core/architecture_core.dart';
import 'package:architecture_core/global/app_module.dart';
import 'package:example/modules/books/router/books_router.dart';

class BooksModule extends AppModule {
  BooksModule() : super("books_module", BooksRouter(), storagePermissions: [StoragePermissions.WRITE, StoragePermissions.READ, StoragePermissions.DELETE]);
}