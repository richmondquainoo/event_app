import 'package:event_app/Screens/HomeScreen.dart';
import 'package:event_app/Screens/RegistrationScreen.dart';
import 'package:event_app/Screens/VerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/TextButtonComponent.dart';
import '../Constants/myColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? email;
  String? password;
  bool showPassword = true;
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Don't have an account? ",
                  style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                },
                child: Container(
                  child: Text(
                    "Register",
                    style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w700, color:MAIN_COLOR),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: const EdgeInsets.only(left: 34.0),
              child: Text("Login",
                style: GoogleFonts.lato(fontSize: 26,fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34.0,top: 10,right: 5),
              child: Text("Welcome back! Please enter your login credentials below to access your account",
                style: GoogleFonts.raleway(fontSize: 16,fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 14,right: 14),
              child: Column(
                children: [
                  const SizedBox(height: 6,),
                  Container(
                    height: 48,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: Center(
                      child: TextField(
                        obscureText: false,
                        style: const TextStyle(color: Colors.black54),
                        controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  const BorderSide(
                                color: MAIN_COLOR, width: 0.5),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide:
                            BorderSide(color: Colors.black, width: 0.7),
                          ),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Container(
                    height: 48,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(left: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                    ),
                    child: Center(
                      child: TextField(
                        obscureText: showPassword,
                        style: const TextStyle(color: Colors.black54),
                        controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color:MAIN_COLOR, width: 0.3),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            borderSide:
                            BorderSide(color: Colors.black, width: 0.7),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: "Password",
                          suffix: IconButton(
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  if (showPassword) {
                                    showPassword = false;
                                  } else {
                                    showPassword = true;
                                  }
                                });
                              },
                              icon: Icon(showPassword == true
                                  ? Icons.remove_red_eye
                                  : Icons.password)),
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Center(
                      child: Text("Click the Login button to access your account. "
                          "We're glad to have you back and hope you enjoy using our app!",
                        style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBoxValue = value!;
                          });
                        },
                        activeColor: MAIN_COLOR,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Keep me logged in",
                              style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              // overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VerificationScreen()));

                    },
                    child: const TextButtonComponent(
                      fontSize: 20,
                      label: "Login",
                      borderRadius: 8,
                      labelColor: MAIN_COLOR,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700,
                      buttonHeight: 54,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),

    );
  }
}
