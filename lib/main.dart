import 'package:epl_predictor/src/screens/MyHomePage.dart';
import 'package:epl_predictor/src/screens/country_selector_01.dart';
import 'package:epl_predictor/src/utilities/darkTheme/dark_theme_provider.dart';
import 'package:epl_predictor/src/utilities/darkTheme/dark_theme_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  // we are fetching the value from preferences and setting the value in provider
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, child) {
          return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: Styles.themeData(themeChangeProvider.darkTheme,context),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: CountrySelectorScreen(),
    );
      }),
    );
  }
}



//  return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       //   visualDensity: VisualDensity.adaptivePlatformDensity,
//       // ),
//       home: CountrySelectorScreen(),
//     );