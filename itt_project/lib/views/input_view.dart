import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';

class InputView extends StatelessWidget {
  InputView({Key? key}) : super(key: key);

  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /// [20/9/2022]
      //! TODO 1- 20-25 lint rules
      //TODO 1a- rendering ::: can be delayed
      //TODO 1b- inherted widget ::: can be delayed
      //! TODO 2- 20-25 lint rules

      //! TODO 3-[at least have an over view on 10 params inside Scaffold with example]
      //! TODO 4-[at least have an over view on 15 params inside appBar with example]


      appBar: AppBar(


        leading: const Icon(Icons.access_alarm),
        /*actions: [
          Text('Just Try'),
          Icon(Icons.real_estate_agent)
        ],*/
        elevation: 15,
        shadowColor: Colors.pink,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.red,
          ])),
        ),
        foregroundColor: Colors.white,
        toolbarOpacity: 0.5,
        titleTextStyle: const TextStyle(fontSize: 20),
        titleSpacing: 20,
        actionsIconTheme: const IconThemeData.fallback(),
        //iconTheme:IconThemeData.fallback(),
        leadingWidth: 30,
        toolbarHeight: 120,
        primary: true,



        //! TODO 5-[Extract method vs extract widget ]
        title: const Text(
          "Input Form Example",
        ),

        // centerTitle: true,
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

              textAlign: TextAlign.center,
              maxLines: 3,

              showCursor: false,
              textDirection: TextDirection.ltr,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                selectAll: true,
                cut: false,
                paste: true,
              ),

              maxLength: 14,
              decoration: const InputDecoration(
                label: Text("ID"),
                hintText: "Enter your National ID",
              ),
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly,

              //],
              buildCounter: (context,
                  {required int currentLength,
                  bool isFocused = true,
                  int? maxLength}) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.info),
                    Text(
                        "the current char is $currentLength of allowed $maxLength Char"),
                  ],
                );
              },

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
              textAlign: TextAlign.center,
              showCursor: true,
              minLines:1,
              maxLines: 2,
              mouseCursor: MaterialStateMouseCursor.clickable,
              textDirection: TextDirection.ltr,
              controller: textFieldController,
              autocorrect: false,
              toolbarOptions: const ToolbarOptions(
                copy: true,
                selectAll: true,
                cut: false,
                paste: true,
              ),
              cursorHeight: 40,
              cursorWidth: 5,
              cursorRadius: const Radius.circular(50),

              style: const TextStyle(
                color: Colors.cyan,
                fontSize: 20,
              ),
              textAlignVertical: TextAlignVertical.top,





              onChanged: (value) {
                //on each key stroke onChanged is fired
                debugPrint(value.toString());
              },

              onSubmitted: (value) {
                debugPrint("the is the submitted val: =>$value");
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(200),
              ],

              // buildCounter:(context,{required int currentLength ,bool isFocused = true,int? maxLength}){
              //   return const SizedBox.shrink();
              // },
              // readOnly: true,
              textCapitalization: TextCapitalization.characters,

              decoration: const InputDecoration(
                  hintMaxLines: 2,

                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.male_rounded ),
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
                if(value == "ahmed" ){
                  print("ok");
                }
                else{

                }

                debugPrint("the is the submitted val: =>$value");
              },
              obscureText: true,
              // readOnly: true,
              obscuringCharacter: "*",
              enabled: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 25)),
                disabledBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 20)),
                enabledBorder: OutlineInputBorder(
                    // gapPadding: 0
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 15)),
                label: Text(
                  "Password",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                hintText: "Please enter 6 digits password",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
              ),

              //! TODO 8-use a generalized theme on textfield
            )
          ],
        ),
      ),


      drawer: Drawer(
        child: Container(
          alignment: Alignment.center,
          height: 200,
          width: 200,
          child: const Text(
            "Try it Now ",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      endDrawer: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 200,
            width: 200,
            child: const Text(
              "Try it Now ",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
      bottomSheet: const Icon(Icons.content_cut_sharp),
      persistentFooterButtons: const [
        Icon(Icons.add_card),
        Icon(Icons.contacts_sharp)
      ],
      primary:false ,
      resizeToAvoidBottomInset: true,
      drawerEdgeDragWidth: 50,
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_card,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_card,
            ),
            label: 'add',
          ),
        ],
      ),
    );
  }
}
