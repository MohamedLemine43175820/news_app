import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/sheard/components/components.dart';

class SearchScreen  extends StatelessWidget {


  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),

      body: BlocConsumer<NewsCubit , NewsStates>(
        listener: (BuildContext context, NewsStates state) {  },
        builder: (BuildContext context, NewsStates state) {

          var list = NewsCubit.get(context).search;

          return Column(

            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(

                  controller:searchController,
                  keyboardtype: TextInputType.text,
                  validate: (value){
                    if(value!.isEmpty){

                      return 'search must not be empty';
                    }

                    return null ;
                  },

                  label: 'Search',
                  prefixIcon: Icons.search,

                  onChanged: (value){

                    NewsCubit.get(context).getSearch(value);
                  },




                ),
              ),
              Expanded(child: articleBuilder(list, context))

            ],
          );
        },

      ),
    );
  }
}
