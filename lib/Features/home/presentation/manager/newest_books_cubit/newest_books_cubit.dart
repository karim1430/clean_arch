import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_case/fetch_newest_book_use_case.dart';
import 'package:meta/meta.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());
  final FetchNewestBookUseCase fetchNewestBookUseCase;
  Future<void> fetchNewestBoods() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBookUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
