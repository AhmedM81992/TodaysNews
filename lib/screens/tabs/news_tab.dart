import 'package:flutter/material.dart';
import 'package:new_c10_monday/models/source_response.dart';
import 'package:new_c10_monday/screens/bloc/cubit.dart';
import 'package:new_c10_monday/screens/widgets/news_item.dart';
import 'package:new_c10_monday/screens/widgets/source_item.dart';
import 'package:new_c10_monday/shared/network/remote/api_manager.dart';

class NewsTab extends StatelessWidget {
//class NewsTab extends StatefulWidget {
//   List<Sources> sources; //we will take this list and put in the cubit
//   NewsTab({required this.sources, super.key});
//
//   @override
//   State<NewsTab> createState() => _NewsTabState();
// }
//
// class _NewsTabState extends State<NewsTab> {
//   //int selectedIndex = 0; // added to cubit

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            //length: widget.sources.length,
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                onTap: (value) {
                  HomeCubit.get(context).changeSelectedSource(value);
                  //selectedIndex = value; //replaced by changeSelectedSource in cubit
                  //setState(() {});
                },
                //tabs: widget.sources.map((e) => Tab(
                tabs: HomeCubit.get(context)
                    .sources
                    .map((e) => Tab(
                          child: SourceItem(
                            source: e,
                            selected:
                                //widget.sources.elementAt(selectedIndex) == e,
                                HomeCubit.get(context).sources.elementAt(
                                        HomeCubit.get(context).selectedIndex) ==
                                    e,
                          ),
                        ))
                    .toList())),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return NewsItem(article: HomeCubit.get(context).articles[index]);
            },
            itemCount: HomeCubit.get(context).articles.length,
          ),
        ),
        // FutureBuilder(
        //   future:
        //       ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.hasError) {
        //       return Center(
        //         child: Text("Something Went Wrong"),
        //       );
        //     }
        //     var articles = snapshot.data?.articles ?? [];
        //     return Expanded(
        //       child: ListView.separated(
        //         separatorBuilder: (context, index) => SizedBox(
        //           height: 12,
        //         ),
        //         itemBuilder: (context, index) {
        //           return NewsItem(article: articles[index]);
        //         },
        //         itemCount: articles.length,
        //       ),
        //      );
        //   },
        // )
      ],
    );
  }
}
