import 'dart:convert';
import 'package:http/http.dart' as http;

import 'errors.dart';


class ApiResponse {
  late bool success;
  late String title;
  late String message;
  late Map data;

  ApiResponse({
    required this.success,
    this.title = "",
    this.message = "",
    required this.data,
  });

  ApiResponse.fromResponse(http.Response response) {
    success = response.statusCode.toString().startsWith('2');

    if (!success) {
      Map error = Errors.getError(response.statusCode.toString());
      title = error['title'];
      message = error['message'];
    }

    print(response.statusCode);

    try {
      data = jsonDecode(utf8.decode(response.bodyBytes));
    } catch (e) {
      print("ERROR: $e");
      data = {};
    }
  }
}