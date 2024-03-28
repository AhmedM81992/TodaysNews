import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:new_c10_monday/source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=dotenv.env['HTTP_API_KEY_BROWSER']
    try {
      Uri url = Uri.https(
        "newsapi.org",
        "/v2/top-headlines/sources", /* {
        "apiKey": dotenv.env['HTTP_API_KEY_BROWSER']
      }*/
      ); //Takes Authority ,Sources and Parameter
      // we use this to connect with Params.
      //NOTE: we only use one of them at a time.
      //=========================================================================================
      //we use this to connect with header.
      http.Response response = await http.get(
        url,
        headers: {"x-api-key": dotenv.env['HTTP_API_KEY_BROWSER']!},
      );
      // var json = jsonDecode(response.body); //so we can take type Map note that the .body
      Map<String, dynamic> json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      print(e.toString());
    }
  }
}
