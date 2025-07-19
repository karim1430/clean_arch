import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/domain/use_case/fetch_search_books_use_case.dart';
import 'package:bookly_app/Features/search/presentation/managers/search_book/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly_app/core/utils/setup_service_relocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(
          FetchSearchBooksUseCase(getIt.call<SearchRepoImpl>())),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
