import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'dart:io' show Platform;

class AdaptiveExample extends StatelessWidget {
  const AdaptiveExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat(DateFormat.HOUR_MINUTE_SECOND);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          OutlinedButton(
            child: const Text("Open Dialog"),
            // TODO: alt: https://pub.dev/packages/adaptive_dialog
            onPressed: () async {
              ///[Example 1]
              // showOkAlertDialog(
              //     context: context,
              //     okLabel: "Okay",
              //     title: "Congrats!",
              //     message:
              //         "you are really a tough guy for staying till ${formatter.format(DateTime.now())}");
              ///[Example 2]
              // var fedResult = await showOkCancelAlertDialog(
              //     context: context,
              //     title: "Feedback",
              //     message: "Are you still intersted in this course",
              //     okLabel: "Yes",
              //     cancelLabel: "No boring");
              // if (fedResult == OkCancelResult.cancel) {
              //   showOkAlertDialog(
              //       context: context,
              //       title: "رأيك لنفسك",
              //       message: "please try later");
              // }
              ///[Example 3]
              showOkAlertDialog(
                  context: context,
                  title: "System",
                  message: Platform.isAndroid
                      ? "you are running an android phone"
                      : "you are  not using  android phone");
            },
          ),
        ]),
      ),
    );
  }
}
