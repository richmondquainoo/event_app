import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/HomeEventContainer.dart';
import '../Components/ListTileMenuComponent.dart';
import '../Constants/myColors.dart';
import '../Models/Data.dart';
import '../Models/Event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  List<Widget> buildCategoriesWidgets() {
    List<Widget> categoriesWidgets = [];
    for (Map category in categories) {
      categoriesWidgets.add(GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _selectedCategory == categories.indexOf(category)
                ? KAppColor
                : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Icon(category['icon'], color: Colors.white),
              const SizedBox(width: 10),
              Text(category['name'], style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _selectedCategory = categories.indexOf(category);
          });
        },
      ));
    }
    return categoriesWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Material(
          color:Colors.black,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: <Widget>[
                    DrawerHeader(
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AvatarGlow(
                              endRadius: 35,
                              glowColor: MAIN_COLOR,
                              child: Container(
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage('assets/pp.jpg'),
                                  radius: 25,
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Richie',
                                  style:
                                  GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTileMenuComponent(
                      icon: Icons.group_work_sharp,
                      label: 'Categories',
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.pop(context);

                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.menu,
                      label: 'Events',
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTileMenuComponent(
                      icon: Icons.vertical_split_sharp,
                      label: 'More',
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Home",
          style: GoogleFonts.raleway(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.1,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Adenta, Accra',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: const CircleAvatar(
                        radius: 20,

                      ),
                    )
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    suffixIcon: Icon(Icons.filter_list, color: Colors.white),
                  ),
                  onChanged: (val) {},
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: buildCategoriesWidgets(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'This Weekend',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 290,
                  child: ListView.builder(
                    itemCount: weekendEvents.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Event event = weekendEvents[index];
                      return HomeEventContainer(
                        event: event,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Upcoming Events',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: upcomingHomeEvents.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Event event = upcomingHomeEvents[index];
                      return HomeEventContainer(
                        event: event,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}


