import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_c10_monday/screens/bloc/cubit.dart';
import 'package:new_c10_monday/screens/bloc/states.dart';
import 'package:new_c10_monday/screens/repo/home_repo.dart';
import 'package:new_c10_monday/screens/repo/remote_dto.dart';
import 'package:new_c10_monday/screens/tabs/news_tab.dart';
import 'package:new_c10_monday/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryID;

  DataTab({required this.categoryID, super.key});

  @override
  Widget build(BuildContext context) {
    //must return BlocProvider
    return BlocProvider(
      //HomeCubit()..getSources(categoryID)
      //the .. takes an object from HomeCubit then went to call on
      //the getSources
      create: (context) => HomeCubit(HomeRemoteDS())..getSources(categoryID),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(child: CircularProgressIndicator()),
                );
              },
            );
          } //else if (state is HomeGetNewsSuccessState) {  edited this to be able to change slides
          else if (state is HomeGetNewsSuccessState ||
              state is ChangeSelectedSource) {
            HomeCubit.get(context).getNewsData();
          }
        },
        builder: (context, state) {
          //return NewsTab(sources: BlocProvider.of<HomeCubit>(context).sources);
          //return NewsTab(sources: HomeCubit.get(context).sources); //we dont need this anymore for cubit
          return NewsTab();
        },
      ),
    );

    /*return FutureBuilder(
      future: ApiManager.getSources(categoryID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went Wrong"),
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return NewsTab(sources: sourcesList); // transfered to cubit
        //we dont need this anymore since we are going to use cubit
        //and with cubit we cant use future build or dont need to
      },
    );*/
  }
}
