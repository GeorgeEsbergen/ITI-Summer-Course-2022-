import 'package:flutter/material.dart';
import 'package:itt_project/task/fields.dart';
import 'package:itt_project/task/sign_up_screen.dart';
import 'package:itt_project/task/start.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static String routeName = "/ForgotPasswordScreen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    const color1 = Color(0xff03C19B);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color1,
          title: const Text('Forgot Password'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(

                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff8BEAD7 ),
                     Color(0xff4EE0C3),
                   Color(0xff03C19B),
                  ],),),
            ),


            Center(
              child: SizedBox(
                height: 500,
                width: 400,
                child: Card(
                  elevation: 1,
                  shadowColor: color1,


                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock,
                        color: color1,
                        size: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Forgot Password !',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        'Enter Your Email to send new Password',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextForms(
                        maxLen: 30,
                        inputType: TextInputType.emailAddress,
                        prefixIcons: null,
                        obscureText: false,
                        hintText: "example@gmail.com",
                        labelText: "Email",
                        returnedError: "Email must empty",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                        (states) => color1),
                              ),
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: const Text('Reset Password')),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                        (states) => color1),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (
                                            context) => const StartScreen()),
                                        (route) => false);
                              },
                              child: const Text('Back to start screen')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
