import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/demo_controller.dart';

class GetxViewExample extends StatelessWidget {
  const GetxViewExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var myController = Get.find<DemoController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GetX<DemoController>(
          // init: DemoController(),

            builder: (myController) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: OutlinedButton(
                            onPressed: myController.increaseReactiveValue,
                            child: Text(
                              "add",
                              style: Theme.of(context).textTheme.headline2,
                            ))),
                    Text(
                      myController.counter.value.toString(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    RotatedBox(
                        quarterTurns: 1,
                        child: OutlinedButton(
                            onPressed: myController.decreaseReactiveValue,
                            child: Text(
                              "substract",
                              style: Theme.of(context).textTheme.headline2,
                            ))),
                  ],
                )),
      ),
    );
  }
}
