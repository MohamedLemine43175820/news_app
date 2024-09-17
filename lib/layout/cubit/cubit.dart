import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/sheard/network/local/cache_helper.dart';
import 'package:news_app/sheard/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(InitialState());

  static NewsCubit  get(context) => BlocProvider.of(context) ;


  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [

    BottomNavigationBarItem(
        icon: Icon(Icons.business,),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports,),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science,),
      label: 'Science',
    ),


  ];

  void changeButtomNavBar(int index){

    currentIndex = index;
    if(index == 1)
      getSports();

    if(index == 2)
      getScience();

    emit(NewsButtomNabBarState());
  }

  List<Widget> screens = [

    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),



  ];

 /* List<String> titles = [

    'Business Screen',
    'Sports Screen',
    'Science Screen',
  ];*/

  // cree methode get in cubit

  List<dynamic> business = [];


void getBusiness(){

  emit(NewsGetBusinessLoadingState());

  DioHelper.getData(
      url: 'news',
      queries: {
        'country': 'us',
        'category': 'business',
        //'language': 'en',
        'apikey': 'pub_529247717d6ae7c8b25d8143ae7d8568cf33f',
      }
  ).then((value){

   // print(value.data.toString());                     // value = type respobse dynamic data jaytni

    business = value.data['results'];
    //print(business[0]['title']);
    print(business.toString());

    emit(NewsGetBusinessSuccessState());


  //  print(business)
  }).catchError((error){

    print(error.toString());

    emit(NewsGetBusinessErrorState(error.toString()));
  });
}




  List<dynamic> sports = [];


  void getSports(){

    emit(NewsGetSportsLoadingState());


    if(sports.length == 0) {
      DioHelper.getData(
          url: 'news',
         // token : token,
         // lang : 'en',

          queries: {
            'country': 'us',
            'category': 'sports',
            //'language': 'en',
            'apikey': 'pub_529247717d6ae7c8b25d8143ae7d8568cf33f',
          }
      ).then((value) {
        // print(value.data.toString());                     // value = type respobse dynamic data jaytni

        sports = value.data['results'];
        //print(business[0]['title']);
        print(sports [0]['title']);

        emit(NewsGetSportsSuccessState());


        //  print(business)
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else {

      emit(NewsGetSportsSuccessState());
    }
  }


  List<dynamic> science = [];


  void getScience(){

    emit(NewsGetScienceLoadingState());

    if(science.length == 0) {
      DioHelper.getData(
          url: 'news',
          queries: {
            'country': 'us',
            'category': 'science',
            //'language': 'en',
            'apikey': 'pub_529247717d6ae7c8b25d8143ae7d8568cf33f',
          }
      ).then((value) {
        // print(value.data.toString());                     // value = type respobse dynamic data jaytni

        science = value.data['results'];
        //print(business[0]['title']);
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());


        //  print(business)
      }).catchError((error) {
        print(error.toString());

        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else {

      emit(NewsGetScienceSuccessState());
    }
  }



  List<dynamic> search = [];


  void getSearch(value) {
    emit(NewsGetSearchLoadingState());

    search = [];


    DioHelper.getData(
        url: 'news/everything',
        queries: {
          //'country': 'us',
          //'category': 'science',
          //'language': 'en',
          'q':'$value',
          'apikey': 'pub_529247717d6ae7c8b25d8143ae7d8568cf33f',
        }
    ).then((value) {
      // print(value.data.toString());                     // value = type respobse dynamic data jaytni

      search = value.data['results'];
      //print(business[0]['title']);
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());


      //  print(business)
    }).catchError((error) {
      print(error.toString());

      emit(NewsGetSearchErrorState(error.toString()));
    });
  }





  bool isDark = false ;



  void changeAppMode({ bool? fromShared}) {

    if(fromShared != null){

      isDark = fromShared;
      emit(NewsChangeModeState());
    }


    else {
      isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value){

      emit(NewsChangeModeState());

    });
  }


  }





}