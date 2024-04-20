import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_c10_monday/models/NewsDataModel.dart';

import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/screens/repo/home_repo.dart';
import 'package:new_c10_monday/shared/components/constants.dart';
import 'package:new_c10_monday/shared/network/remote/end_points.dart';
import 'package:new_c10_monday/shared/styles/app_strings.dart';

class HomeRemoteDS implements HomeRepo {
  @override
  Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https(
        Constants.BASE_URL, EndPoints.newsData, {"sources": sourceId});
    http.Response response =
        await http.get(url, headers: {AppStrings.apiKey: Constants.API_KEY!});
    var json = jsonDecode(response.body);

    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  @override
  Future<SourceResponse> getSources(String categoryID) async {
    Uri url = Uri.https(
        Constants.BASE_URL, EndPoints.sources, {"category": categoryID});
    http.Response response = await http.get(
      url,
      headers: {AppStrings.apiKey: Constants.API_KEY!},
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    //return SourceResponse.fromJson(json); // we change it to this
    SourceResponse sourceResponse = SourceResponse.fromJson(json);

    return sourceResponse;
  }
}
