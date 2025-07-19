import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/feature_book_item.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.books});
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const CustomBookdetailsAppBar(),
        const SizedBox(
          height: 36,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .22,
          ),
          child: FeatureBookItem(
            books: books,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          books.title,
          style: Style.textStyle30,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            books.author!,
            style: Style.textStyle18,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        BooksRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rate: books.rate,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(books: books),
      ],
    );
  }
}
