import 'package:innovator/api_models/api_constants.dart';
import 'package:innovator/api_models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Model>> getBooks() async {
    List<Model> _model = [];
    try {
      var url = Uri.parse(Api.url + Api.endpoint);
      var response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        _model = modelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return _model = [];
  }
}
