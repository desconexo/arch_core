import 'package:example/modules/books/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books page"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("This is the books page"),
            ElevatedButton(
              onPressed: () => Get.toNamed(RouteBuilder.search),
              child: Text("Tap to travel"),
            ),
          ],
        ),
      ),
    );
  }
}
