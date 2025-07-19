import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

import 'package:meta/meta.dart';

import '../../../domain/use_case/fetch_search_books_use_case.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBooksUseCase) : super(SearchBooksInitial());
  final FetchSearchBooksUseCase searchBooksUseCase;

  Future<void> fetchSearchBooks(
      {required String category, required int pageNumber}) async {
    if (pageNumber == 0) {
      emit(SearchBooksLoading());
    } else {
      emit(SearchBooksPaginationLoading());
    }
    var books = await searchBooksUseCase.call(category, pageNumber);
    books.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchBooksFailure(errMessage: failure.errMessage));
      } else {
        emit(SearchBooksPaginationFailure(errMessage: failure.errMessage));
      }
    }, (books) {
      emit(SearchBooksSuccess(books: books));
    });
  }
}
