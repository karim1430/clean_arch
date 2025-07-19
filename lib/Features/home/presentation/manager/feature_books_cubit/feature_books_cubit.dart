import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_case/fetch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featuredBookUseCase) : super(FeatureBooksInitial());
  final FetchFeaturedBookUseCase featuredBookUseCase;
  Future<void> fetchFeatureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBooksloading());
    } else {
      emit(FeatureBooksPaginationloading());
    }
    var result = await featuredBookUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeatureBooksFailure(errMessage: failure.errMessage));
      } else {
        emit(FeatureBooksPaginationFailure(errMessage: failure.errMessage));
      }
    }, (books) {
      emit(FeatureBooksSccsess(books: books));
    });
  }
}
