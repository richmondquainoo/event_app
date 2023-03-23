
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Event.dart';
import '../Screens/EventScreen.dart';

class HomeEventContainer extends StatelessWidget {
  final Event? event;

  const HomeEventContainer({Key? key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(
              event: event,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                Container(
                  height: 210,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(event!.image!),
                    ),
                  ),
                ),
                Positioned(
                    right: 10,
                    left: 10,
                    bottom: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Free",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          event!.category!['icon'],
                          color: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            event!.name!,
            style:GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
              ),
              Text(
                event!.location!,
                style: GoogleFonts.raleway(
                  decoration: TextDecoration.underline,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 20),
               Text(
                '800 seats available',
                style: GoogleFonts.raleway(
                  fontSize: 11,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
