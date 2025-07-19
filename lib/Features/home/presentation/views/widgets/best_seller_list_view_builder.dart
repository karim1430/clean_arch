import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListViewBuilder extends StatelessWidget {
  const BestSellerListViewBuilder({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return BookListViewItem(
            book: BookEntity(
              bookID: books[index].bookID,
              image: books[index].image,
              title: books[index].title,
              author: books[index].author,
              price: books[index].price,
              rate: books[index].rate,
              // preview: books[index].preview
            ),
          );
        });
  }
}
