import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly_app/core/utils/app_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/style.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kBookDetailsView, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 40, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: AspectRatio(
                aspectRatio: 2.2 / 4,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: book.image ?? '',
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.title,
                      style: Style.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    book.author ?? '',
                    style: Style.textStyle14
                        .copyWith(color: const Color(0xff707070)),
                  ),
                  const SizedBox(height: 10), // Add some spacing
                  Row(
                    // Removed Expanded here
                    children: [
                      Text(
                        book.price.toString(),
                        style: Style.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      // Add some spacing
                      BooksRating(
                        rate: book.rate,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
