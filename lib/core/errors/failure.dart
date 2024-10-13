import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure('connection time out with Api Server');
        break;
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        return ServerFailure('send time out with Api Server');
        break;
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure('receive time out with Api Server');
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure('Un Authorise');
        break;
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        return ServerFailure('Error on the response');
        break;
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerFailure('Response canceled by user');
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        return ServerFailure('connection error with Api Server');
        break;
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        return ServerFailure('Error Happened');
        break;
    }
  }
}
