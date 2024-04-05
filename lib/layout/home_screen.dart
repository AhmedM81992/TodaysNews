import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:new_c10_monday/models/category_model.dart';
import 'package:new_c10_monday/screens/Drawer_menu.dart';
import 'package:new_c10_monday/screens/tabs/categories_tab.dart';
import 'package:new_c10_monday/screens/widgets/search_widget.dart';

import 'package:new_c10_monday/shared/styles/my_theme_data.dart';
import 'package:new_c10_monday/screens/tabs/settings_tab.dart';

import '../models/NewsSearchModel.dart';
import '../screens/tabs/data_tab.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var sKey = GlobalKey<ScaffoldState>();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenHeight;
    return Container(
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        drawer: DrawerMenu(onClick: onDrawerClicked),
        appBar: AppBar(
          title: Text('News').tr(),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, SearchWidget.routeName);
                  isSearching = true;
                });
              },
            ),
          ],
        ),
        // appBar: AppBar(
        //   title: Text('News').tr(),
        // ),
        body: categoryModel == null
            ? CategoriesTab(
                onClick: onCategoryClicked,
              )
            : DataTab(categoryID: categoryModel!.id),
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClicked(val) {
    if (val == DrawerMenu.CATEGORY_ID) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (val == DrawerMenu.SETTING_ID) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SettingsTab(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
  }
}
