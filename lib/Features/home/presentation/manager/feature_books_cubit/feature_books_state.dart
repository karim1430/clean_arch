part of 'feature_books_cubit.dart';

@immutable
sealed class FeatureBooksState {}

final class FeatureBooksInitial extends FeatureBooksState {}

final class FeatureBooksloading extends FeatureBooksState {}

final class FeatureBooksFailure extends FeatureBooksState {
  final String errMessage;

  FeatureBooksFailure({required this.errMessage});
}

final class FeatureBooksPaginationloading extends FeatureBooksState {}

final class FeatureBooksPaginationFailure extends FeatureBooksState {
  final String errMessage;

  FeatureBooksPaginationFailure({required this.errMessage});
}

final class FeatureBooksSccsess extends FeatureBooksState {
  final List<BookEntity> books;

  FeatureBooksSccsess({required this.books});
}
