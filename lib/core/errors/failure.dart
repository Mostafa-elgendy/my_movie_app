import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class LoginFailure extends Failure {
  LoginFailure(super.message);
}

class RegisterFailure extends Failure {
  RegisterFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Connection Ttimeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode,
            dioException.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFailure("ApiServer request was cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("ApiServer connection error");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpexted, try again");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found");
    } else if (statusCode == 500) {
      return ServerFailure("Server failure, try again later");
    } else {
      return ServerFailure("Opps There is an error $statusCode");
    }
  }
}
