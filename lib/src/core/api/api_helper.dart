import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jusst_challenge/src/core/api/app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "";

  Future<dynamic> get(String subUrl,
      [String accessToken, bool withBaseURL = true]) async {
    var responseJson;

    try {
      print("sending get request $subUrl");
      var headers = <String, String>{};
      if (accessToken != null) {
        headers["Authorization"] = "Bearer $accessToken";
      }
      print("GET request sent with token: Bearer $accessToken");

      var response;

      if (withBaseURL) {
        response = await http.get(_baseUrl + subUrl, headers: headers);
      } else {
        response = await http.get(subUrl, headers: headers);
      }

      print("GET request response is ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch (e) {
      print("exception is $e");
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${e.statusCode}');
    }
    return responseJson;
  }

  Future<dynamic> post(String subUrl, body, [accessToken]) async {
    var responseJson;
    try {
      print("sending POST request $subUrl}");
      var headers = <String, String>{};
      if (body != null) {
        headers["Content-Type"] = "application/json";
        headers["Accept"] = "application/json";
      } else {
        headers["Content-Length"] = "0";
        headers["Accept"] = "*/*";
      }
      if (accessToken != null) headers["Authorization"] = "Bearer $accessToken";

      var response;

      if (body != null)
        response =
            await http.post(_baseUrl + subUrl, body: body, headers: headers);
      else
        response = await http.post(_baseUrl + subUrl, headers: headers);

      print("POST response statusCode ${response.statusCode}");
      print("POST response body ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      print("SocketException");
      throw FetchDataException('No Internet connection');
    } catch (e) {
      if (e is AppException)
        throw e;
      else
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${e.statusCode}');
    }
    return responseJson;
  }

  Future<dynamic> patch(String subUrl, body, [accessToken]) async {
    var responseJson;
    try {
      print("sending patch request $subUrl}");
      var headers = <String, String>{};
      if (body != null) {
        headers["Content-Type"] = "application/json";
        headers["Accept"] = "application/json";
      } else {
        headers["Content-Length"] = "0";
        headers["Accept"] = "*/*";
      }
      if (accessToken != null) headers["Authorization"] = "Bearer $accessToken";

      var response;

      if (body != null)
        response =
            await http.patch(_baseUrl + subUrl, body: body, headers: headers);
      else
        response = await http.patch(_baseUrl + subUrl, headers: headers);

      print("patch response ${response.statusCode}");
      print("patch response ${response.body}");
      responseJson = _returnResponse(response);
    } on SocketException {
      print("SocketException");
      throw FetchDataException('No Internet connection');
    } catch (e) {
      if (e is AppException)
        throw e;
      else
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${e.statusCode}');
    }
    return responseJson;
  }

  Future<dynamic> delete({String subUrl, String token}) async {
    var responseJson;
    try {
      print("sending delete request $subUrl}");
      var headers = <String, String>{};
      headers["Content-Type"] = "application/json";
      headers["Accept"] = "application/json";
      headers["Authorization"] = "Bearer $token";

      final response = await http.delete(_baseUrl + subUrl, headers: headers);
      print("delete response ${response.statusCode}");
      print("delete response ${response.body}");
      responseJson = json.decode(response.statusCode.toString());
    } on SocketException {
      print("SocketException");
      throw FetchDataException('No Internet connection');
    } catch (e) {
      if (e is AppException)
        throw e;
      else
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${e.statusCode}');
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  print("response status is ${response.statusCode}");
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
