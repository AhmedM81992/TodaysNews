import 'package:flutter/material.dart';
import 'package:new_c10_monday/screens/tabs/news_tab.dart';
import 'package:new_c10_monday/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryID;
  DataTab({required this.categoryID, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
        return NewsTab(sources: sourcesList);
      },
    );
  }
}
