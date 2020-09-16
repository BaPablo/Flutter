import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tarea2_ttm/models/heroes.dart';

class TestService {
  final String _baseUrl = 'https://www.hectoralvarez.dev/icc727/';

  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Authorization': 'mi\$up34Token'
  };

  Future<Heroes> getLista() async {
    final response =
        await http.get(this._baseUrl + 'heroes.json', headers: this._headers);

    print('Código status del GET: ${response.statusCode}');
    if (response.statusCode == 200) {
      //print(response.body);
      return Heroes.fromJson(json.decode(response.body));
    }

    return Heroes();
  }

  Future<bool> postGreeting() async {
    final response = await http.post(this._baseUrl,
        headers: this._headers, body: jsonEncode({"saludo": "hola"}));

    print('Código status del POST: ${response.statusCode}');
    if (response.statusCode == 200) print(response.body);

    return true;
  }
}
