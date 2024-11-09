import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);
  static const routeName = "/InputView";
  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  final GlobalKey<FormState> inputFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    void printData(String data) {
      debugPrint("the submitted data is => $data");
    }
// https://www.youtube.com/watch?v=4gA2XnMdGBg
    /*
      form
      name => val
      ID => val
      name => val
      ID => val
name => val
      ID => val




      */

    return Scaffold(
      /// [20/9/2022]
      //! TODO 1- 20-25 lint rules
      //TODO 1a- rendering ::: can be delayed
      //TODO 1b- inherted widget ::: can be delayed
      //! TODO 2- 20-25 lint rules

      //! TODO 3-[at least have an over view on 10 params inside Scaffold with example]
      appBar: AppBar(
        //! TODO 4-[at least have an over view on 15 params inside appBar with example]
        //! TODO 5-[Extract method vs extract widget ]
        title: const Text(
          "Input Form Example",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            //! TODO 6-[at least have an over view on 5 params inside TextField with example]

            Text(
              "Let's do it",
              style: Theme.of(context).textTheme.headline5,
            ),
            //! TODO 7-[at least have an over view on 20 params inside TextField with example]
            Form(
              key: inputFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              // Unique Key/Key//Global Key/Local Key // Value Key//
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 14,
                    decoration: const InputDecoration(
                      label: Text("ID"),
                      hintText: "Enter your National ID",
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (val) {
                      //val == null ?nothing : val.length
                      if (val == null) return null;
                      if (val.length != 14) {
                        return "the national id must be of 14 digits";
                      }
                      return null;
                    },
                    // valid
                    // buildCounter: (context,
                    //     {required int currentLength,
                    //     bool isFocused = true,
                    //     int? maxLength}) {
                    //   return Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       const Icon(Icons.info),
                    //       Text(
                    //           "the current char is $currentLength of allowed $maxLength Char"),
                    //     ],
                    //   );
                    // },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      //on each key stroke onChanged is fired
                      debugPrint(value.toString());
                    },
                    // //Tear-offs
                    // onSubmitted: printData,

                    // readOnly: true,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      //on each key stroke onChanged is fired
                      debugPrint(value.toString());
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    validator: (fName) {
                      //val == null ?nothing : val.length
                      if (fName == null) return null;

                      if (fName.isEmpty) {
                        return "full name can't be empty";
                      }

                      return null;
                    },
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                        label: Text("Full name"),
                        hintText: "Please enter your full name as Passport"),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      //on each key stroke onChanged is fired
                      debugPrint(value.toString());
                    },
                    onSubmitted: (value) {
                      debugPrint("the is the submitted val: =>$value");
                    },
                    obscureText: true,
                    // readOnly: true,
                    obscuringCharacter: "*",
                    enabled: true,
                    decoration: const InputDecoration(
                        // focusedBorder: OutlineInputBorder(
                        //     // gapPadding: 0
                        //     borderRadius: BorderRadius.circular(16),
                        //     borderSide:
                        //         const BorderSide(color: Colors.orange, width: 25)),
                        // disabledBorder: OutlineInputBorder(
                        //     // gapPadding: 0
                        //     borderRadius: BorderRadius.circular(16),
                        //     borderSide:
                        //         const BorderSide(color: Colors.purple, width: 20)),
                        // enabledBorder: OutlineInputBorder(
                        //     // gapPadding: 0
                        //     borderRadius: BorderRadius.circular(16),
                        //     borderSide:
                        //         const BorderSide(color: Colors.blue, width: 15)),
                        label: Text("Password"),
                        hintText: "Please enter 6 digits password"),
                    //! TODO 8-use a generalized theme on textfield
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  if (inputFormKey.currentState?.validate() == true) {
                    print("true");
                  } else {
                    print("some or all of your fields are invalid");
                  }
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                icon: const Icon(Icons.message),
                label: const Text("Submit now")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                icon: const Icon(Icons.message),
                label: const Text("Go back")),
                
                ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                //TODO: simple navigation app using 12 navigation methods
                  
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                icon: const Icon(Icons.message),
                label: const Text("back to main "))
          ],
        ),
      ),
    );
  }
}
