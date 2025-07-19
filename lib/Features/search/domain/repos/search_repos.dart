import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<BookEntity>>> fetchSearchBook(
      {required String category, int pageNumber = 0});
}
