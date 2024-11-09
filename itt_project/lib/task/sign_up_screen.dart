import 'package:flutter/material.dart';
import 'package:itt_project/task/login_screen.dart';
import 'fields.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/SignUpScreen";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Color textColor = const Color(0xff03C19B);
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
                  height: 60,
                ),
                Container(
                  alignment: const Alignment(-0.7, 0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: blackColor),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextForms(
                          maxLen: 15,
                          obscureText: false,
                          inputType: TextInputType.text,
                          prefixIcons: Icon(
                            Icons.person,
                            color: blackColor,
                          ),
                          hintText: "Enter Your First Name",
                          labelText: "Firs Name",
                          returnedError: "This name maybe used",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextForms(
                          maxLen: 15,
                          obscureText: false,
                          inputType: TextInputType.text,
                          prefixIcons: Icon(
                            Icons.person_outline_rounded,
                            color: blackColor,
                          ),
                          hintText: "Enter Your Last Name",
                          labelText: "Last Name",
                          returnedError: "This name maybe used or empty ",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextForms(
                          maxLen: 12,
                          inputType: TextInputType.number,
                          obscureText: false,
                          prefixIcons: Icon(
                            Icons.phone_android,
                            color: blackColor,
                          ),
                          hintText: "Enter Your Phone Number ",
                          labelText: "Phone",
                          returnedError: "This phone isn't correct",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextForms(
                          maxLen: 40,
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          prefixIcons: Icon(
                            Icons.email_outlined,
                            color: blackColor,
                          ),
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          returnedError: "email can't  be empty",
                        ),
                        const SizedBox(
                          height: 10,
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
                            Icons.lock_open,
                            color: blackColor,
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          returnedError: "password is empty",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextForms(
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                            color:blackColor,
                          ),
                          obscureText: true,
                          maxLen: 8,
                          inputType: TextInputType.number,
                          prefixIcons: Icon(
                            Icons.lock_outline_rounded,
                            color: blackColor,
                          ),
                          hintText: "Confirm Password",
                          labelText: " Confirm Password",
                          returnedError: "password is empty",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign Up ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff03C19B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "if you have account ",
                              style: TextStyle(fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(fontSize: 15, color: blackColor ,fontWeight: FontWeight.w900),
                              ),
                            )
                          ],
                        )
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
