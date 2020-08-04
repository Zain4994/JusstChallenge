
import 'package:jusst_challenge/src/models/error_response.dart';
import 'package:jusst_challenge/src/resources/app_contstants.dart';

class ApiResponse<T> {
  Status _status;
  T data;
  String errorMessageKey;

  ApiResponse.completed(this.data) : _status = Status.COMPLETED;

  ApiResponse.error({this.errorMessageKey, this.data}) : _status = Status.ERROR;

  @override
  String toString() {
    return "Status : $_status \n Message : $errorMessageKey \n Data : $data";
  }

  ///A getter to check whether the response has finished successfully or not
  bool get hasSucceeded => _status == Status.COMPLETED;

  ///A getter to check whether the response has failed or not
  bool get hasFailed => _status == Status.ERROR;

  ///Returns the returned API response in success case, in failure case it will
  /// use [_handleErrorMessage] to parse the error and return the appropriate
  /// error message
  ApiResponse get withErrorMessageKey {
    if (_status == Status.COMPLETED) {
      return this;
    } else {
      return _handleErrorMessage(this.data as ErrorResponse);
    }
  }

  ///Checks the error response code and returns the suitable localized error
  /// message key
  ApiResponse _handleErrorMessage(ErrorResponse errorResponse) {
    if (errorResponse == null) {
      return ApiResponse.error(errorMessageKey: "connection_error");
    }

    switch (errorResponse.code) {
      default:
        return ApiResponse.error(errorMessageKey: "connection_error");
    }
  }
}

enum Status { COMPLETED, ERROR }
