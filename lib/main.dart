import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/sheard/bloc_observer.dart';
import 'package:news_app/sheard/network/local/cache_helper.dart';
import 'package:news_app/sheard/network/remote/dio_helper.dart';
import 'package:news_app/sheard/styles/themes.dart';


void main()  async {

WidgetsFlutterBinding.ensureInitialized();      // sure qui chose async execute apres run

  Bloc.observer = MyBlocObserver();

  DioHelper.init();                     // cree object men dio ela lyn open app

 await  CacheHelper.init();

 bool? isDark = CacheHelper.getData(key: 'isDark');                  // pour get data dans var

  runApp( MyApp(isDark!));


}



class MyApp extends StatelessWidget  {

  final bool? isDark ;

  MyApp(this.isDark);


  @override
  Widget build(BuildContext context) {
    // return Widget it name is MaterialApp grand widget contain all screens

    // MultiBlocpProvider() : pour creat two or three bloc providers

    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, NewsStates state) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,


            // APP theme light

            theme: lightTheme,

            // app theme dark

            darkTheme:darkTheme ,





            // pour token entre light and dark

            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,


            home: NewsLayout(),

          );
        },

      ),
    );

    //  Directionality(  textDirection: TextDirection.rtl,): change direction














  }




}

