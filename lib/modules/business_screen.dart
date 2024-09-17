
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/sheard/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context, NewsStates state) {  },
      builder: (BuildContext context, NewsStates state) {

        var list  = NewsCubit.get(context).business;

        return articleBuilder(list , context);
      },

    );



  }
}