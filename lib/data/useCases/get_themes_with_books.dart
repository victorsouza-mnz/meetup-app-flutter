import 'dart:convert';

import 'package:ra_app/infra/http_client.dart';
import 'package:ra_app/models/temas.dart';

class GetThemesWithBooks {
  final HttpClient? httpClient;
  final String? url;

  GetThemesWithBooks({this.httpClient, this.url});

  Future<List<Tema>> exec() async {
    var response = await httpClient?.get(url);

    if (response?.statusCode == 200) {
      var decodeResponse = await jsonDecode(response.body);

      List<Tema> themes = [];

      for (var theme in decodeResponse) {
        themes.add(Tema.fromResponse(theme));
      }

      return themes;
    } else {
      throw Exception('request faild');
    }
  }
}
