import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.books});
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        books: books,
      ),
    );
  }
}
