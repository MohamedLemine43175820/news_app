abstract class NewsStates {}

class InitialState extends NewsStates {}

class NewsButtomNabBarState extends NewsStates {}



class NewsGetBusinessLoadingState extends NewsStates {}


class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {

  final String error ;

  NewsGetBusinessErrorState(this.error);     // pour passse error vers U

}





class NewsGetSportsLoadingState extends NewsStates {}


class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {

  final String error ;

  NewsGetSportsErrorState(this.error);     // pour passse error vers U

}




class NewsGetScienceLoadingState extends NewsStates {}


class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {

  final String error ;

  NewsGetScienceErrorState(this.error);     // pour passse error vers U

}


class NewsGetSearchLoadingState extends NewsStates {}


class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {

  final String error ;

  NewsGetSearchErrorState(this.error);     // pour passse error vers U

}


class NewsChangeModeState extends NewsStates {}