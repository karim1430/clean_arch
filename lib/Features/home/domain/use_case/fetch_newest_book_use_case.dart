import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_ropo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';

class FetchNewestBookUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([var pageNumber = 0]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
