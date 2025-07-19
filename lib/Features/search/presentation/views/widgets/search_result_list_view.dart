import 'dart:developer';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/presentation/managers/search_book/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.search});
  final String search;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  @override
  void didUpdateWidget(covariant SearchResultListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.search != widget.search) {
      setState(() {
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(category: widget.search, pageNumber: 0);
      });
    }
  }

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {
        if (state is SearchBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SearchBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResultListViewBlocConsumer(
            books: books,
            search: widget.search,
          );
        } else if (state is SearchBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class SearchResultListViewBlocConsumer extends StatefulWidget {
  const SearchResultListViewBlocConsumer({
    super.key,
    required this.books,
    required this.search,
  });
  final List<BookEntity> books;
  final String search;

  @override
  State<SearchResultListViewBlocConsumer> createState() =>
      _SearchResultListViewBlocConsumerState();
}

class _SearchResultListViewBlocConsumerState
    extends State<SearchResultListViewBlocConsumer> {
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
        BlocProvider.of<SearchBooksCubit>(context)
            .fetchSearchBooks(category: widget.search, pageNumber: nextPage);
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
    return BlocListener<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {
        if (state is SearchBooksSuccess) {
          nextPage++;
          isloading = false;
        } else if (state is SearchBooksPaginationFailure ||
            state is SearchBooksFailure) {
          isloading = false;
        } else if (state is SearchBooksPaginationLoading) {
          isloading = true;
        }
      },
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return BookListViewItem(
            book: widget.books[index],
          );
        },
      ),
    );
  }
}
