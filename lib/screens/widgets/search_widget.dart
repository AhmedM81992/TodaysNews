import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_c10_monday/models/NewsSearchModel.dart';
import 'package:new_c10_monday/screens/widgets/sub_items/search_list_items.dart';
import 'package:new_c10_monday/shared/network/remote/api_manager.dart';
import 'package:new_c10_monday/shared/styles/my_theme_data.dart';

class SearchWidget extends StatefulWidget {
  static const String routeName = "SearchWidget";
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isSearching = false;
  final searchController = TextEditingController();
  List<Articles>? searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(303)),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: MyThemeData.primaryColor),
                      prefixIcon:
                          Icon(Icons.search, color: MyThemeData.primaryColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: MyThemeData.primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: MyThemeData.primaryColor,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        searchMovies(text);
                      } else {
                        setState(() {
                          searchResults!.clear();
                        });
                      }
                    },
                  ),
                )
              : Text('Search Page').tr(),
          actions: [
            IconButton(
              icon: isSearching ? Icon(Icons.close) : Icon(Icons.search),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    // Clear search results and text field when closing search bar
                    searchResults!.clear();
                    searchController.clear();
                  }
                });
              },
            )
          ],
        ),
        body: Expanded(
          child: searchResults != null
              ? searchResults!.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No search Results to Display"),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: searchResults!.length,
                      itemBuilder: (context, index) {
                        return SearchListItems(articles: searchResults![index]);
                      },
                    )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Future<void> searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        // Calls the API to get search results
        NewsSearchModel? searchModel = await ApiManager.getNewsSearch(query);
        if (searchModel != null) {
          setState(() {
            searchResults = searchModel.articles;
          });
          print("Search Results: ${searchResults?.length}");
          print("Query: $query");
        }
      } catch (e) {
        print("Error searching movies: $e");
      }
    }
  }
}
