import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ra_app/models/temas.dart';

Future<List<Tema>> fetchThemesWithBooks(String path) async {
  String base = 'https://content.respondeai.com.br/api/v2$path';
  var config = {
    'user-jwt':
        'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImlkIjozMjkwMTg1LCJnbG9iYWxfdW5pdmVyc2l0eV9pZCI6ImNjNGIwZDA5LWIxMjEtNGNjMy04NDU5LTJkZWMxNDZkZGI3OCIsImlzX2xvZ2dlZCI6dHJ1ZSwiaGFzX2FjY2VzcyI6ZmFsc2UsImxvZ2luX3Rva2VuIjpudWxsLCJtb2JpbGVfdG9rZW4iOm51bGwsImdsb2JhbF9jYW1wdXNfaWQiOiIyMjY5NmNjMS1lNDQyLTRlZDItYTZmOC0zYWVmYzdjZjcyZmEiLCJ1bml2ZXJzaXR5X2hhc19jYW1waSI6dHJ1ZSwic2Vzc2lvbl9pZCI6NjY4MjMyNywicGxhdGZvcm0iOiJXZWIifSwiZXhwIjoxNjc3ODczNzQ3fQ.Vj_sQk-btREJEV8ZVVUxNUv76F7Ffxq_7riOIB6Zo78'
  };

  final response = await http.get(Uri.parse(base), headers: config);

  if (response.statusCode == 200) {
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
