
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/Data.dart';
import '../Models/Event.dart';
import '../Screens/EventScreen.dart';

class ProfileEventContainer extends StatelessWidget {
  final Event? event;

  const ProfileEventContainer({Key? key, this.event}) : super(key: key);
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
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 10),
            child: Text(
              '${event!.duration} days left',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(event!.image!),
                  )),
                ),
                Positioned(
                    right: 20,
                    left: 20,
                    top: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: KAppColor,
                          child: Text(
                            event!.date!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.share,
                          color: Colors.white,
                        )
                      ],
                    )),
                Positioned(
                  right: 10,
                  left: 10,
                  bottom: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event!.name!,
                        style: const TextStyle(
                          fontSize: 40,
                          wordSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text(
                                event!.location!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            event!.fromTo!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
