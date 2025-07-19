import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/domain/repos/search_repos.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSearchBooksUseCase implements UseCase<List<BookEntity>, String> {
  final SearchRepos searchRepos;

  FetchSearchBooksUseCase(this.searchRepos);
  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [var category, var pageNumber = 0]) async {
    return await searchRepos.fetchSearchBook(
        category: category, pageNumber: pageNumber);
  }
}
