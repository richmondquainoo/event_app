import 'package:event_app/Constants/myColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/TextButtonComponent.dart';
import 'LoginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  var usernameController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? passwordConfirm;

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
              Text(
                "Already have an account? ",
                style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Text(
                  " Sign In",
                  style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w700, color: MAIN_COLOR),
                ),
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Text("Create a new account",
              style: GoogleFonts.lato(fontSize: 26,fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 34.0,top: 10,right: 5),
            child: Text("Welcome to our sign up page! "
                "Please fill out the following information to create your account",
              style: GoogleFonts.raleway(fontSize: 15,fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 14,right: 14),
            child: Column(
              children: [
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
                      controller: firstNameController,
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: MAIN_COLOR, width: 0.7),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0.7),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "First Name",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
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
                      controller: lastNameController,
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
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
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "Last Name",
                        labelStyle: const TextStyle(
                            color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
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
                          borderSide: const BorderSide(
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
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 5),
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
                const SizedBox(height: 25,),
                Center(
                  child: Text("By signing up, you agree to our terms of service and privacy policy.",
                    style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w400),
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
                      activeColor: Colors.teal,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I have accepted the",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          // overflow: TextOverflow.fade,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            child: const Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              // overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),

                  ],
                ),
                const SizedBox(height: 12,),
                InkWell(
                  splashColor: Colors.grey,
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                  },
                  child: const TextButtonComponent(
                    fontSize: 20,
                    label: "Register",
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
    );
  }
}
