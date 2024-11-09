import 'package:flutter/material.dart';
import 'package:itt_project/task/forgot_password.dart';
import 'package:itt_project/task/sign_up_screen.dart';
import 'fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/LoginScreen";
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();
  final Color textColor =  const Color(0xff03C19B);
  final Color blackColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: const Alignment(-0.7, 0),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextForms(
                          maxLen: 40,
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          prefixIcons: Icon(
                            Icons.email_outlined,
                            color: blackColor ,
                          ),
                          hintText: 'Enter Email',

                          labelText: 'Email',
                          returnedError: "email can't  be empty",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextForms(
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: blackColor,
                          ),
                          maxLen: 8,
                          inputType: TextInputType.number,
                          obscureText: true,
                          prefixIcons: Icon(
                            Icons.lock_open_outlined,

                            color: blackColor,
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          returnedError: "password is empty",
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {Navigator.pushNamedAndRemoveUntil(context,ForgotPasswordScreen.routeName, (route) => true );},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: blackColor),
                              ),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white70,

                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign in ",
                              style: TextStyle(
                                fontSize: 20,
                                color :Color(0xff03C19B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have account?",
                              style: TextStyle(fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800, color: Colors.black),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
