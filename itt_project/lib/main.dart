import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itt_project/travel_app/main_screen.dart';

import 'getx_day10/controller.dart';
import 'getx_day10/get_builder.dart';
import 'views/home_view.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  Get.lazyPut(() => DemoController(), fenix: true);
  // Get.put(DemoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spending Tracking',
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(

        // fontFamily: "Changa",
        //   primarySwatch: Colors.indigo,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          
            ),
          ),
          textTheme: const TextTheme(
              headline5: TextStyle(fontWeight: FontWeight.w700))),
       home:const  StartScreens(),

    );
  }
}
