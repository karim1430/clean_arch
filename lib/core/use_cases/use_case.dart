import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call([var params]);
}

class Param {}
