import 'package:example/modules/books/entities/book_brief.dart';
import 'package:example/modules/books/presentation/controllers/books_home_controller.dart';
import 'package:example/modules/books/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooksHome extends GetWidget<BooksHomeController> {
  final double width = (Get.width - 60) / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books page"),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: StreamBuilder<List<BookBrief>>(
                stream: controller.books.stream,
                initialData: controller.books,
                builder: (_, booksSnapshot) {
                  if(!booksSnapshot.hasData || booksSnapshot.data!.isEmpty) {
                    return SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Wrap(
                    children: booksSnapshot.data!.map<Widget>((book) => bookCard(book)).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookCard(BookBrief book) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteBuilder.search(book.id)),
      child: Container(
        width: width,
        padding: EdgeInsets.all(10),
        child: Image.network(book.cover, fit: BoxFit.fitWidth,),
      ),
    );
  }
}
