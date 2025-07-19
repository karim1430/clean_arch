import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_route.dart';

class FeatureBookItem extends StatelessWidget {
  const FeatureBookItem({super.key, required this.books});
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoute.kBookDetailsView, extra: books);
        },
        child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: books.image ?? '',
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))),
      ),
    );
  }
}
