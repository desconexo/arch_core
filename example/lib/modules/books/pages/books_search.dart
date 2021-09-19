import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Search page"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("This is the book search page"),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text("Tap to travel back"),
            ),
          ],
        ),
      ),
    );
  }
}
