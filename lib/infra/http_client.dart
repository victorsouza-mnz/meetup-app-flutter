import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl;
  final Map<String, String> config;

  HttpClient(
      {this.baseUrl = 'https://content.respondeai.com.br/api/v2',
      this.config = const {
        'user-jwt':
            'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImlkIjozMjkwMTg1LCJnbG9iYWxfdW5pdmVyc2l0eV9pZCI6ImNjNGIwZDA5LWIxMjEtNGNjMy04NDU5LTJkZWMxNDZkZGI3OCIsImlzX2xvZ2dlZCI6dHJ1ZSwiaGFzX2FjY2VzcyI6ZmFsc2UsImxvZ2luX3Rva2VuIjpudWxsLCJtb2JpbGVfdG9rZW4iOm51bGwsImdsb2JhbF9jYW1wdXNfaWQiOiIyMjY5NmNjMS1lNDQyLTRlZDItYTZmOC0zYWVmYzdjZjcyZmEiLCJ1bml2ZXJzaXR5X2hhc19jYW1waSI6dHJ1ZSwic2Vzc2lvbl9pZCI6NjY4MjMyNywicGxhdGZvcm0iOiJXZWIifSwiZXhwIjoxNjc3ODczNzQ3fQ.Vj_sQk-btREJEV8ZVVUxNUv76F7Ffxq_7riOIB6Zo78'
      }});

  get(String? path) async {
    final response =
        await http.get(Uri.parse(baseUrl + path!), headers: config);

    return response;
  }
}
