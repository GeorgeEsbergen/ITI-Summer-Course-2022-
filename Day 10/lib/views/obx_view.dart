import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day_1_future/controllers/demo_controller.dart';
import 'package:day_1_future/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObxScreen extends StatelessWidget {
  const ObxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DemoController());

    var myCont = Get.find<DemoController>();
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: myCont.names.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var student = myCont.names[index];
                      return Text(student);
                    },
                  ),
                  TextButton(
                      onPressed: () async {
                        var newStudent = await showTextInputDialog(
                            context: context,
                            title: "Add new student",
                            message: "Please enter your student name",
                            barrierDismissible: false,
                            cancelLabel: "Back",
                            okLabel: "Enroll",
                            textFields: [
                              const DialogTextField(
                                hintText: "Student name",
                                maxLines: 1,
                                validator: Validators.validateInput,
                              )
                            ]);
                        //Guarding
                        //selfimproving.dev
                        if (newStudent == null) return;
                        myCont.addNewStudent(hisName: newStudent.first);
                        // myCont.addNewStudent();
                      },
                      child: const Text("add new student"))
                ],
              )),
          const Spacer(),
          const MiddleCounter(),
          const Spacer()
        ],
      )),
    );
  }
}

class MiddleCounter extends StatelessWidget {
  const MiddleCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myController = Get.find<DemoController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() => Row(
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
    );
  }
}
