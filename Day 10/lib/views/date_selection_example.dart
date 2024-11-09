import 'package:day_1_future/views/getx_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'getbuilder_view.dart';
import 'obx_view.dart';

class CardExample extends StatefulWidget {
  const CardExample({Key? key}) : super(key: key);

  @override
  State<CardExample> createState() => _CardExampleState();
}

DateTime? selectedDate;

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat.MMMEd();
    selectedDate ??= DateTime.now();
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            formatter.format(selectedDate ?? DateTime.now()),
            style: Theme.of(context).textTheme.headline2,
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed("/AdaptiveExample");
              },
              icon: const Icon(Icons.arrow_circle_right),
              label: const Text("Adaptive")),
          ElevatedButton(
              onPressed: () async {
                //! TODO: ui https://itsallwidgets.com/flutter-travel-app-travel-hour
                //TODO: 1: 1-4 state management
                //TODO 2:at least 15 insideshowDatePicker

                //TODO:? 3:Future builder stream builder
                //TODO 4: Generics
                // https://selfimproving.dev/generics.html

                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1992),
                        lastDate: DateTime(2025))
                    .then((value) {
                  //no nullable
                  //     if(value == null) return;
                  // setState(() {

                  //   selectedDate = value;
                  // });
                  setState(() {
                    selectedDate = value;
                  });
                });
              },
              child: const Text("click me")),
          Container(
            width: 120,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite_border),
                SizedBox(
                  width: 8,
                ),
                Text("31"),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: BorderRadius.circular(20)),
          ),
          TextButton(
              onPressed: () {
                Get.to(() => const ObxScreen());
              },
              child: const Text("to OBX screen")),
              TextButton(
              onPressed: () {
                Get.to(() => const GetxViewExample());
              },
              child: const Text("to Getx screen")),
              TextButton(
              onPressed: () {
                Get.to(() => const GetBuilderExample());
              },
              child: const Text("to Getbuilder screen"))
          // // RawChip(label: label,),
          // ActionChip(label: label, onPressed: onPressed,),
          // InputChip(label: label,),
          // Chip
          
        ]),
      ),
    );
  }
}
