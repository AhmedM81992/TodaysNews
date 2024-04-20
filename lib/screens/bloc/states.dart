abstract class HomeStates {}

class HomeInitState extends HomeStates {}

// getting sources from api
class HomeGetSourcesLoadingState extends HomeStates {}

class HomeGetSourcesSuccessState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {
  String errorMessage;
  HomeGetSourcesErrorState(this.errorMessage);
}

// getting news from api
class HomeGetNewsLoadingState extends HomeStates {}

class HomeGetNewsSuccessState extends HomeStates {}

class HomeGetNewsErrorState extends HomeStates {
  String errorMessage;
  HomeGetNewsErrorState(this.errorMessage);
}

class ChangeSelectedSource extends HomeStates {}
