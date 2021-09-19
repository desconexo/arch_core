import 'package:architecture_core/architecture_core.dart';
import 'package:architecture_core/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:example/modules/books/entities/book.dart';
import 'package:example/modules/books/repository/books_repository.dart';

class GetBookDataUS extends UseCase<Book, String> {
  final BooksRepository repository;

  GetBookDataUS(this.repository);

  @override
  Future<Either<Failure, Book>> call([String? params]) {
    return repository.getBook(bookId: params!);
  }
}