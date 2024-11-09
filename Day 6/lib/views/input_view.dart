import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            TextField(
              maxLength: 14,
              decoration: const InputDecoration(
                label: Text("ID"),
                hintText: "Enter your National ID",
                
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly,
              
              ],
              buildCounter:(context,{required int currentLength ,bool isFocused = true,int? maxLength}){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.info),
                    Text("the current char is $currentLength of allowed $maxLength Char"),
                  ],
                );
              },
              keyboardType: TextInputType.number,
              onChanged: (value) {
                //on each key stroke onChanged is fired
                debugPrint(value.toString());
              },
              onSubmitted: (value) {
                debugPrint("the is the submitted val: =>$value");
              },

              // readOnly: true,
            ),
            TextField(
              onChanged: (value) {
                //on each key stroke onChanged is fired
                debugPrint(value.toString());
              },
              
              onSubmitted: (value) {
                debugPrint("the is the submitted val: =>$value");
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),

              ],

              // buildCounter:(context,{required int currentLength ,bool isFocused = true,int? maxLength}){
              //   return const SizedBox.shrink();
              // },
              // readOnly: true,
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
              decoration: (
                  focusedBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.orange,
                    width: 25)
                  ),
                  disabledBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.purple,
                    width: 20)
                  ),
                  enabledBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.blue,
                    width: 15)
                  ),
                  

                  label: const Text("Password"),
                  hintText: "Please enter 6 digits password"),
                  //! TODO 8-use a generalized theme on textfield
                  
            )
          ],
        ),
      ),
    );
  }
}
