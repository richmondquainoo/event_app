import 'package:event_app/Screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/TextButtonComponent.dart';
import '../Constants/myColors.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/backgroundImg.png",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.5),
            colorBlendMode: BlendMode.darken,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 220,
              ),
              decoration: BoxDecoration(
                color: BLACK_COLOR.withOpacity(0.35),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 44,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/logo.png",),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Vento",
                      style: GoogleFonts.amethysta(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          BottomButton(),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 58.0, left: 20, right: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 1.0,
                right: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Join us for an unforgettable event experience! Create an account now and stay up-to-date with all the latest information about events. With your account, "
                            "you will have access to our exclusive content, event schedule, and networking opportunities."
                            " Register today and be ready to join the fun!"
                            '!',
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              splashColor: Colors.grey,
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()));
              },
              child: const TextButtonComponent(
                fontSize: 20,
                label: "Get Started",
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
    );
  }
}

