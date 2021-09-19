import 'package:example/modules/books/entities/book.dart';
import 'package:example/modules/books/presentation/controllers/book_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookInfo extends GetWidget<BookInfoController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Book?>(
      stream: controller.stream,
      initialData: controller.book,
      builder: (_, bookSnapshot) {
        if (!bookSnapshot.hasData)
          return Scaffold(body: Center(child: CircularProgressIndicator()));

        return Scaffold(
          appBar: AppBar(title: Text("Book ${controller.bookId}"),),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    controller.book!.title, style: Get.theme.textTheme.headline1,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 9/16,
                  child: Image.network(
                    controller.book!.cover, fit: BoxFit.fitWidth,
                  ),
                ),
                Text(controller.book!.description, textAlign: TextAlign.justify,),
                SizedBox(height: 8,),
                Text("${controller.book!.pageCount} pages"),
                SizedBox(height: 8,),
                Text("Authors:"),
                Column(
                  children: controller.book!.authors.map<Widget>((author) => Text(author)).toList(),
                ),
              ],
            ),
          ),
        );
      });
  }
}
