import 'package:bookly_app/Features/home/domain/repos/home_ropo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBookUseCase implements UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBookUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([var pageNumber = 0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }
}
