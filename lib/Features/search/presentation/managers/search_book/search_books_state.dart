part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksPaginationLoading extends SearchBooksState {}

final class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure({required this.errMessage});
}

final class SearchBooksPaginationFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksPaginationFailure({required this.errMessage});
}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess({required this.books});
}
