import 'package:architecture_core/core/errors/failures.dart';
import 'package:architecture_core/core/utils/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:example/modules/books/entities/book_brief.dart';
import 'package:example/modules/books/repository/books_repository.dart';

class GetBooksUS extends UseCase<List<BookBrief>, String> {
  final BooksRepository repository;

  GetBooksUS(this.repository);

  @override
  Future<Either<Failure, List<BookBrief>>> call([String? params]) {
    return repository.getBooks();
  }

}