import 'package:jusst_challenge/src/models/error_response.dart';

class AppException implements Exception {
  final message;
  final ErrorResponse errorResponse;

  AppException({this.errorResponse, this.message});

  String toString() {
    return "${message ?? ""}";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message: "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message: "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message: "Unauthorised: ");
}
