import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String description;
  final List<String> authors;
  final String cover;
  final int pageCount;

  Book({
    required this.cover,
    required this.title,
    required this.authors,
    required this.description,
    required this.pageCount,
  });

  @override
  List<Object?> get props => [
    this.cover,
    this.title,
    this.authors,
    this.description,
    this.pageCount,
  ];
}