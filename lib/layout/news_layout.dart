import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/sheard/components/components.dart';
import 'package:news_app/sheard/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< NewsCubit , NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(

          appBar: AppBar(
            title:  const Text('News App'),
            actions: [
              IconButton(
                onPressed: (){

                  NewsCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4),
              ),
              IconButton(
                  onPressed: (){

                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search),
              ),

            ],
          ),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){

              cubit.changeButtomNavBar(index);
            },
            items: cubit.bottomItems,

          ),

          floatingActionButton: FloatingActionButton(
              onPressed: (){

              /*  DioHelper.getData(
                    url: 'v2/top-headlines',
                    queries: {

                      'country': 'us',
                      'category': 'business',
                      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
                    }
                ).then((value){

                  print(value.data.toString());                     // value = type respobse dynamic data jaytni
                }).catchError((error){

                  print(error.toString());
                });*/

              },
            child: Icon(Icons.add),

          ),


          body: cubit.screens[cubit.currentIndex],
        );
      },

    );
  }
}
