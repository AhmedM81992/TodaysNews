import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_c10_monday/layout/home_screen.dart';
import 'package:new_c10_monday/shared/styles/my_theme_data.dart';
import 'package:new_c10_monday/providers/language_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = "Settings";
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final List<String> Lang = ['English', "Arabic"];
  String? value;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Settings').tr(),
        ),
        drawer: Drawer(
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
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.home,
                      size: 40,
                    ),
                    SizedBox(width: dynamicWidth * 0.01),
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).tr()
                  ],
                ),
                onTap: () => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            HomeScreen(),
                        transitionDuration: Duration(seconds: 0))),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Language'.tr()),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: MyThemeData.primaryColor, width: 1),
                ),
                width: dynamicWidth * 0.4,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: EdgeInsets.only(right: 8),
                    iconSize: 20,
                    iconEnabledColor: MyThemeData.primaryColor,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    value: value ??
                        provider
                            .languageCode, // Set the initial value to the current language code
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue; // Update the selected language
                      });
                      if (newValue != null) {
                        provider.changeLanguage(
                            newValue); // Change the language in the provider
                      }
                    },
                    items: Lang.map((lang) => DropdownMenuItem(
                          value: lang == 'English'
                              ? 'en'
                              : 'ar', // Set the value to the language code
                          child: Text(
                            lang,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: MyThemeData.primaryColor),
                          ),
                        )).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
