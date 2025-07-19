import 'package:dio/dio.dart';

class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioErrors(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badcertificate with api server');
      case DioExceptionType.badResponse:
        ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        ServerFailure('request to api server was canceld');
      case DioExceptionType.connectionError:
        ServerFailure('No internet Connection');
      case DioExceptionType.unknown:
        ServerFailure('Oops was an Errors , please try again');
    }

    return ServerFailure('Oops was an Errors , please try again???');
  }

  factory ServerFailure.fromBadResponse(int statuCode, dynamic response) {
    if (statuCode == 404) {
      return ServerFailure('Your request was not Found, please try later');
    } else if (statuCode == 500) {
      return ServerFailure('there is a problem with server, please try later');
    } else if (statuCode == 400 || statuCode == 401 || statuCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('there was an error , please try again');
    }
  }
}
