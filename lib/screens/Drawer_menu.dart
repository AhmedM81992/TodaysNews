import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_c10_monday/shared/styles/my_theme_data.dart';

class DrawerMenu extends StatelessWidget {
  Function onClick;
  DrawerMenu({required this.onClick, super.key});

  static int CATEGORY_ID = 1;
  static int SETTING_ID = 2;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double dynamicHeight = screenHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = screenHeight;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: MyThemeData.greenColor),
              child: Center(
                child: Text(
                  'News App!',
                  style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: MyThemeData.whiteColor),
                ).tr(),
              )),
          ListTile(
              title: InkWell(
                child: Row(
                  children: [
                    Icon(
                      Icons.view_list,
                      size: 40,
                    ),
                    SizedBox(width: dynamicWidth * 0.01),
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                  ],
                ),
              ),
              onTap: () {
                onClick(CATEGORY_ID);
              }),
          ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  SizedBox(width: dynamicWidth * 0.01),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr()
                ],
              ),
              onTap: () {
                onClick(SETTING_ID);
              })
        ],
      ),
    );
  }
}
