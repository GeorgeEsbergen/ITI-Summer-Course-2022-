import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day_1_future/controllers/demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/validators.dart';

class GetBuilderExample extends StatelessWidget {
  const GetBuilderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Identifable
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            GetBuilder<DemoController>(
              builder: (myCont) => Column(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: myCont.females.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var student = myCont.females[index];
                      // flutter_slidable
                      return Dismissible(
                        key: ValueKey(student),
                        //TODO 1 : Unique key,value key,global key,local key,key,

                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            var delReq = await showOkCancelAlertDialog(
                                context: context,
                                title: "Delete Student",
                                isDestructiveAction: true,
                                message:
                                    "Are you sure you want to remove '$student' ",
                                okLabel: "Confirm Deletion",
                                cancelLabel: "Rollback");
                            if (delReq == OkCancelResult.cancel) {
                              return Future.value(false);
                            }

                            myCont.removeStudent(student);
                                //Futures
                            return Future.value(true);
                          }
                          return Future.value(false);
                        },
                        child: Material(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(student),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(thickness: 3, color: Colors.white),
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
                        myCont.addHer(herName: newStudent.first);
                        // myCont.addNewStudent();
                      },
                      child: const Text("add new student"))
                ],
              ),
            ),
          ],
        ));
  }
}
