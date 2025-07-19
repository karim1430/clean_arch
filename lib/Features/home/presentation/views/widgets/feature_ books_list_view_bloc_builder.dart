import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/feature_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/feature_books_cubit/feature_books_cubit.dart';
import 'feature_books_list_shimmer.dart';

class FeatureBooksListViewBlocBuilder extends StatefulWidget {
  const FeatureBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatureBooksListViewBlocBuilder> createState() =>
      _FeatureBooksListViewBlocBuilderState();
}

class _FeatureBooksListViewBlocBuilderState
    extends State<FeatureBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: (context, state) {
        if (state is FeatureBooksSccsess) {
          books.addAll(state.books);
        }
        if (state is FeatureBooksPaginationFailure) {
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
        if (state is FeatureBooksSccsess ||
            state is FeatureBooksPaginationloading ||
            state is FeatureBooksPaginationFailure) {
          return FeatureBooksListView(books: books);
        } else if (state is FeatureBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const FeatureBooksListShimmer();
        }
      },
    );
  }
}
