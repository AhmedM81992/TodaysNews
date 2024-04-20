import 'package:new_c10_monday/models/NewsDataModel.dart';
import 'package:new_c10_monday/models/source_response.dart';

abstract class HomeRepo {
  //an abstract class that holds our functions
  Future<SourceResponse> getSources(String categoryID);
  Future<NewsDataModel> getNewsData(String sourceId);
}
