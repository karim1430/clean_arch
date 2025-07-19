import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/data_source/search_local_data_source.dart';
import 'package:bookly_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/search/domain/repos/search_repos.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepos {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;

  SearchRepoImpl(this.searchRemoteDataSource, this.searchLocalDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchBook(
      {required String category, int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = searchLocalDataSource.fetchSearchBook(
          category: category, pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await searchRemoteDataSource.fetchSearchBook(
          category: category, pageNumber: pageNumber);

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErrors(e));
      }
      return left(Failure(e.toString()));
    }
  }
}
