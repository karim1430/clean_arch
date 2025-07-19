import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/feature_book_item.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SimilarFeatureBooksListView extends StatelessWidget {
  const SimilarFeatureBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
          itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FeatureBookItem(
              books: books[index],
            );
          }),
    );
  }
}
