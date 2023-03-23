import 'package:event_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Components/TextButtonComponent.dart';
import '../Constants/myColors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  TextEditingController? textEditingController1;
  late String globalPin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Did not receive that email?",
                  style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Text(
                  "Check your spam filter.",
                  style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 80,),
            Center(
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset("assets/email.png"),
              ),
            ),
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text("Check your email",
                style: GoogleFonts.raleway(fontSize: 24,fontWeight: FontWeight.w800),
              ),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 22.0,right: 4),
              child: Center(
                child: Text("We have sent an OTP to your email. Please enter the OTP in the boxes below",
                  style: GoogleFonts.raleway(fontSize: 15,fontWeight: FontWeight.w600),
                ),
              ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.w600,
                ),
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.black,
                    selectedFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    activeColor: Colors.teal),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: textEditingController1,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 6,
                  )
                ],
                onCompleted: (pin) {
                  print("Completed: $pin");
                  setState(() {
                    globalPin = (pin);
                    // handleVerification(context);
                  });
                },
                onChanged: (pin) {
                  setState(() {
                    globalPin = (pin);
                  });
                },
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                splashColor: Colors.grey,
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: const TextButtonComponent(
                  fontSize: 20,
                  label: "Verify",
                  borderRadius: 8,
                  labelColor: MAIN_COLOR,
                  textColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  buttonHeight: 54,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
