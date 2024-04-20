import 'package:new_c10_monday/models/NewsDataModel.dart';
import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/screens/repo/home_repo.dart';

class HomeLocalDS implements HomeRepo {
  @override
  Future<NewsDataModel> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String categoryID) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
