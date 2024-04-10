import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/screens/bloc/states.dart';
import 'package:new_c10_monday/shared/components/constants.dart';
import 'package:new_c10_monday/shared/network/remote/end_points.dart';
import 'package:new_c10_monday/shared/styles/app_strings.dart';

//this means the following
//class HomeCubit inherits cubit bust see in it's template parameter
//the HomeStates which it will listen on.
class HomeCubit extends Cubit<HomeStates> {
  /*//then we call it's constructor but
  //it will be super and when u call on super
  //stay with the HomeInitState for now.
  //That mean once we call HomeCubit
  //app will stand at HomeInitState*/
  HomeCubit() : super(HomeInitState());

  //we created this function to make easier than to keep writing
  //this NewsTab(sources: BlocProvider.of<HomeCubit>(context).sources);
  //over and over again in data_tab.dart or others.
  static HomeCubit get(context) => BlocProvider.of(context);

  List<Sources> sources =
      []; //then we tell it that by default this list is empty []

  Future<void> getSources(String categoryID) async {
    emit(HomeGetSourcesLoadingState()); //to change state we call emit
    try {
      Uri url = Uri.https(
          Constants.BASE_URL, EndPoints.sources, {"category": categoryID});
      http.Response response = await http.get(
        url,
        headers: {AppStrings.apiKey: Constants.API_KEY!},
      );
      Map<String, dynamic> json = jsonDecode(response.body);
      //return SourceResponse.fromJson(json); // we change it to this
      SourceResponse sourceResponse = SourceResponse.fromJson(json);
      sources = sourceResponse.sources ?? []; //was this in old code
      //NewsTab(sources: sourcesList);
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
    }
  }
}
