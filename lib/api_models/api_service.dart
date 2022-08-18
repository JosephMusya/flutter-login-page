import 'package:innovator/api_models/api_constants.dart';
import 'package:innovator/api_models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Model>?> getBooks() async {
    try {
      var url = Uri.parse(Api.url + Api.endpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Model> _model = modelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      print("Errorr.....");
    }
    return null;
  }
}
