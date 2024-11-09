import 'package:flutter/material.dart';
import 'package:itt_project/task/sign_up_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
  static String routeName = "/StartScreen";
  final Color c1 = const Color(0xff03C19B);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: c1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.android ,color: Colors.white, size: 120,),
            const SizedBox(height: 10),
            const Text(
              'Welcome to our App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 90,),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpScreen()));
                  },
                  child: const Text(
                    "Get Started ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff03C19B),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
