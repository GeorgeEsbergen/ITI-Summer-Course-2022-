import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itt_project/getx_day10/validators.dart';
import 'controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
                      return Slidable(
                        direction: Axis.horizontal,
                        key: ValueKey(student),

                        enabled: true,
                        startActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            closeOnCancel: true,
                              confirmDismiss: () async {
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

                                return Future.value(true);
                              },
                              onDismissed: () {}),
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: "Delete",
                              onPressed: (_)
                                async {
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
                                },

                            )
                          ],
                        ),
                        endActionPane: ActionPane(
                          dragDismissible: false,
                          dismissible: DismissiblePane(

                              onDismissed: () {}),
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.green,
                              icon: Icons.upload,
                              label: "Update",
                              onPressed: (_){},
                             )

                          ],
                        ),
                        child: Container(
                          width: double.infinity,
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
                        if (newStudent == null) return;
                        myCont.addHer(herName: newStudent.first);

                      },
                      child: const Text("add new student"))
                ],
              ),
            ),
          ],
        ));
  }
}
