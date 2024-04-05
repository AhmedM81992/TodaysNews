import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:new_c10_monday/layout/home_screen.dart';
import 'package:new_c10_monday/providers/language_provider.dart';
import 'package:new_c10_monday/providers/my_theme_data_provider.dart';
import 'package:new_c10_monday/screens/tabs/settings_tab.dart';
import 'package:new_c10_monday/screens/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import 'screens/news_details_page.dart';
import 'shared/styles/my_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyThemeDataProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ],
    child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyThemeDataProvider>(context);
    var provider2 = Provider.of<LanguageProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(provider2.languageCode),
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
        SearchWidget.routeName: (context) => SearchWidget(),
      },
    );
  }
}
