import 'package:architecture_core/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/modules/books/entities/book.dart';
import 'package:example/modules/books/entities/book_brief.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<BookBrief>>> getBooks();
  Future<Either<Failure, Book>> getBook({String bookId});
}