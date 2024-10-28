import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pinterest/models/pin.dart';
import '../services/api/api.dart';
import '../services/api/api_response.dart';
import '../services/api/endpoints.dart';

class PinProvider extends ChangeNotifier {
  List<PinModel> pins = [];

  fechPins() async {
    ApiResponse response = await Api.send(EndPoints.photos);
    pins = PinModel.fromJsonList(response.data['photos']);
    notifyListeners();
  }

  SearchPins( String query) async {
    ApiResponse response = await Api.send(EndPoints.searchPins, params: [query]);
    pins = PinModel.fromJsonList(response.data['photos']);
    notifyListeners();
  }

}