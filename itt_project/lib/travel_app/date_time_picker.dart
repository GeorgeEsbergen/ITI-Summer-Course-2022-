import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  State<DateTimePicker> createState() => _DateTimePicker();
}

DateTime? selectedDate;

class _DateTimePicker extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat.MMMEd();
    selectedDate ??= DateTime.now();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            formatter.format(selectedDate ?? DateTime.now()),
            style: Theme.of(context).textTheme.headline2,
          ),

          ElevatedButton(
              onPressed: () {



                showDatePicker(
                    cancelText: "Exit",
                    confirmText: "Change",
                    initialEntryMode: DatePickerEntryMode.input,
                    keyboardType: TextInputType.datetime,
                    helpText: "Write Month first then day then Year",
                    errorFormatText:'Type correct date and month',
                    fieldLabelText : 'month/day/year',
                    fieldHintText: " 1/17/2000",
                    errorInvalidText: "Not Found",


                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1992),
                    lastDate: DateTime(2025))
                    .then((value) {

                  setState(() {
                    selectedDate = value;
                  });
                });
              },
              child: const Text("click me"))
        ]),
      ),
    );
  }
}
