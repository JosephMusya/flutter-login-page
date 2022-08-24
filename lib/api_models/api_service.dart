import 'dart:convert';
import 'dart:io';

import 'package:innovator/api_models/api_constants.dart';
import 'package:innovator/api_models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Model>> getBooks() async {
    List<Model> _model = [];
    try {
      var url = Uri.parse(Api.url + Api.endpoint);
      var _response = await http.get(url).timeout(const Duration(seconds: 5));

      if (_response.statusCode == 200) {
        _model = modelFromJson(_response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return _model = [];
  }

  static Future addBook(data) async {
    try {
      var _response = await http.post(Uri.parse(Api.url),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: jsonEncode(data.toJson(data)));
      return _response;
    } catch (e) {
      print(e.toString());
    }
  }
}
