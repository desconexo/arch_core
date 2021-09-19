import 'package:equatable/equatable.dart';

class BookBrief extends Equatable {
  final String id;
  final String title;
  final String cover;

  BookBrief({required this.cover, required this.id, required this.title});

  @override
  List<Object?> get props => [this.title, this.cover, this.id];
}