import 'package:cryptotracker/screens/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textSize = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'My crypto app',
      theme: ThemeData.dark().copyWith(
        textTheme: textSize.copyWith(
          headline4: textSize.headline4!.copyWith(
            color: Colors.white,
          ),
          headline5: textSize.headline5!.copyWith(
            color: Colors.white,
          ),
          headline6: textSize.headline6!.copyWith(
            color: Colors.white,
          ),
          subtitle1: textSize.subtitle1!.copyWith(
            color: Colors.white,
          ),
          subtitle2: textSize.subtitle2!.copyWith(
            color: Colors.white,
          ),
          overline: textSize.overline!.copyWith(color: Colors.grey),
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
