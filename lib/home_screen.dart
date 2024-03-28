import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_c10_monday/api_manager.dart';
import 'package:new_c10_monday/my_theme_data.dart';
import 'package:new_c10_monday/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("News").tr(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: MyThemeData.greenColor),
                child: Center(
                  child: Text(
                    "News App!",
                    style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: MyThemeData.whiteColor),
                  ).tr(),
                )),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.view_list,
                    size: 40,
                  ),
                  SizedBox(width: dynamicWidth * 0.01),
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr()
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  SizedBox(width: dynamicWidth * 0.01),
                  Text(
                    "Settings",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr()
                ],
              ),
              onTap: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SettingsTab(),
                      transitionDuration: Duration(seconds: 0))),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(),
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
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(sourcesList[index].name ?? "");
            },
            itemCount: sourcesList.length,
          );
        },
      ),
    );
  }
}
