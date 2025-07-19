import 'dart:developer';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/feature_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksListView extends StatefulWidget {
  const FeatureBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeatureBooksListView> createState() => _FeatureBooksListViewState();
}

class _FeatureBooksListViewState extends State<FeatureBooksListView> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_listenerToScroll);
  }

  void _listenerToScroll() {
    var currntPosition = scrollController.position.pixels;
    var maxScrollLenth = scrollController.position.maxScrollExtent;
    if (currntPosition >= 0.7 * maxScrollLenth) {
      if (!isloading) {
        isloading = true;
        log(nextPage.toString());
        BlocProvider.of<FeatureBooksCubit>(context)
            .fetchFeatureBooks(pageNumber: nextPage++);
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_listenerToScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return FeatureBookItem(
              books: widget.books[index],
            );
          }),
    );
  }
}
