import 'dart:convert';
import 'package:http/http.dart' as http;

class DataService{
  static const String baseUrl = 'http://192.168.0.127:3000';

   Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }
}

final dataService = DataService();