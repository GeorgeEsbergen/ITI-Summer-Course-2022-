import 'package:day_1_future/views/adaptive_example_dialog.dart';
import 'package:day_1_future/views/date_selection_example.dart';
import 'package:day_1_future/views/extra_view.dart';
import 'package:day_1_future/views/home_view.dart';
import 'package:day_1_future/views/input_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending Tracking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Changa",
        primarySwatch: Colors.indigo,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange[700],
            onPrimary: Colors.black,
          ),
        ),
        textTheme: const TextTheme(headline5:TextStyle(fontWeight: FontWeight.w700) )
      ),
      // home: const HomeView(),
      routes:{
        "/":(context) => const CardExample(),
        ExtraView.routeName:(context) => const ExtraView(),
        "/AdaptiveExample":(context) => const AdaptiveExample(),
        HomeView.routeName:(context) => const HomeView(),
        InputView.routeName :(context) =>const InputView()

      } ,
    );
  }
}
