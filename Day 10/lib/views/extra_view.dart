import 'package:day_1_future/views/input_view.dart';
import 'package:flutter/material.dart';

class ExtraView extends StatelessWidget {
  const ExtraView({Key? key}) : super(key: key);

  static String routeName = "/ExtraView";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = ModalRoute.of(context)?.settings;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Extra"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        height: size.height,
        width: size.width,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: 0,
              left: 16,
              child: Container(
                color: Colors.white,
                width: size.width - 32,
                height: size.height * 0.45,
                child: Column(
                  children: [
                    OutlinedButton(
                      child: const Text("go back"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    OutlinedButton(
                      child: const Text("to input screen"),
                      onPressed: () {
                      Navigator.of(context).pushNamed(InputView.routeName);
                    
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
