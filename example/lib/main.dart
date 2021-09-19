import 'package:architecture_core/architecture_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/books/books_module.dart';

void main() {
  // AppSettings.appTitle = "example";
  // AppSettings.apiPath = "http://localhost:9000/";
  // AppSettings.enableLog = true;
  // AppSettings.errorHandler = (String s) => print(s);

  AppSettings.init(appTitle: "example", apiPath:  "http://localhost:9000/", enableLog: true, errorHandler: print);
  AppSettings.register(BooksModule());

  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppSettings.initialRoute,
      getPages: AppSettings.routes,
    );
  }
}
