import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:new_c10_monday/models/NewsDataModel.dart';
import 'package:new_c10_monday/models/NewsSearchModel.dart';
import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/shared/components/constants.dart';
import 'package:new_c10_monday/shared/network/remote/end_points.dart';
import 'package:new_c10_monday/shared/styles/app_strings.dart';

class ApiManager {
  // static Future<SourceResponse?> getSources(String categoryID) async {
  //   //https://newsapi.org/v2/top-headlines/sources?apiKey=dotenv.env['HTTP_API_KEY_BROWSER']
  //   try {
  //     Uri url = Uri.https(
  //         Constants.BASE_URL, EndPoints.sources, {"category": categoryID}
  //
  //         /* {
  //       "apiKey": dotenv.env['HTTP_API_KEY_BROWSER']
  //     }*/
  //         ); //Takes Authority ,Sources and Parameter
  //     // we use this to connect with Params.
  //     //NOTE: we only use one of them at a time.
  //     //=========================================================================================
  //     //we use this to connect with header.
  //     http.Response response = await http.get(
  //       url,
  //       headers: {AppStrings.apiKey: Constants.API_KEY!},
  //     );
  //     // var json = jsonDecode(response.body); //so we can take type Map note that the .body
  //     Map<String, dynamic> json = jsonDecode(response.body);
  //     return SourceResponse.fromJson(json);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // } we took this a used it in cubit.dart not needed anymore here

  // static Future<NewsDataModel> getNewsData(String sourceId) async {
  //   Uri url = Uri.https(
  //       Constants.BASE_URL, EndPoints.newsData, {"sources": sourceId});
  //   http.Response response =
  //       await http.get(url, headers: {AppStrings.apiKey: Constants.API_KEY!});
  //   var json = jsonDecode(response.body);
  //
  //   return NewsDataModel.fromJson(json);
  // }

  static Future<NewsSearchModel> getNewsSearch(String searchTerm) async {
    Uri url = Uri.https(Constants.BASE_URL, EndPoints.newsData,
        {"q": searchTerm}); //?q=FINDTHIS?
    http.Response response =
        await http.get(url, headers: {AppStrings.apiKey: Constants.API_KEY!});
    var json = jsonDecode(response.body);
    print(url.toString());

    return NewsSearchModel.fromJson(json);
  }
}
