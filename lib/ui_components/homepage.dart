import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/models/cardModel.dart';
import 'package:ui_test/ui_components/cards/appBarCard.dart';
import 'package:ui_test/ui_components/homepageBody.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  double divIndent = 0;
  int clickedIndex = 0;
  Color divColor = const Color(0xff4E81EB);

  List<Cards> appBarCards = [
    Cards(title: 'Angular', theme: 'blue'),
    Cards(title: 'Flutter', theme: 'red'),
    Cards(title: 'Figma', theme: 'yellow'),
  ];

  List<Cards> recommendationCards = [
    Cards(title: 'Flutter Animations', subtitle: 'Intermediate | 3h 11m', theme: 'blue', icon1: 'headphone', icon2: 'tape'),
    Cards(title: 'Depression', subtitle: '7 Day Audio Series', theme: 'pink', icon1: 'heart', icon2: 'headphone'),
    Cards(title: 'Baby sleep', subtitle: '7 Day Audio Series', theme: 'yellow', icon1: 'headphone', icon2: 'heart'),
  ];

  List<Cards> recentCards = [
    Cards(title: 'Getting Started', theme: 'pink', icon1: 'headphone'),
    Cards(title: 'Managing State', theme: 'red', icon1: 'tape'),
    Cards(title: 'Persisting Data Locally', theme: 'yellow', icon1: 'heart'),
    Cards(title: 'Creating Layouts', theme: 'blue', icon1: 'headphone'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xff121421),
          bottomNavigationBar: BottomNavBar(),
          appBar: TopAppBar(),
          body: HomePageBody(
              recommendationCards: recommendationCards,
              recentCards: recentCards)),
    );
  }

  AppBar TopAppBar() {
    return AppBar(
      toolbarHeight: 150.0,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: const Color(0xff121421),
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Discover",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 0.0,
              color: divColor,
              thickness: 4.0,
              indent: divIndent,
              endIndent: 320 - divIndent,
            ),
          ),
          SizedBox(
            height: 85,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: appBarCards.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      clickedIndex = index;
                      divColor = appBarCards[index].color!;
                      divIndent = appBarCards.isNotEmpty
                          ? index * (320 / (appBarCards.length - 1))
                          : 0;
                    }),
                    child: AppBar_Card(
                        clickedIndex: clickedIndex,
                        appBarCards: appBarCards,
                        index: index),
                  );
                }),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar BottomNavBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SvgPicture.asset(
              'assets/icons/discover.svg',
              color: _selectedIndex == 0
                  ? const Color(0xff4A80F0)
                  : const Color(0xff515979),
              width: 30,
              height: 30,
            ),
          ),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SvgPicture.asset(
              'assets/icons/chart.svg',
              color: _selectedIndex == 1
                  ? const Color(0xff4A80F0)
                  : const Color(0xff515979),
              width: 30,
              height: 30,
            ),
          ),
          label: 'Charts',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SvgPicture.asset(
              'assets/icons/profile.svg',
              color: _selectedIndex == 2
                  ? const Color(0xff4A80F0)
                  : const Color(0xff515979),
              width: 30,
              height: 30,
            ),
          ),
          label: 'Profile',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff1C2031),
      selectedItemColor: const Color(0xff1C2031),
      unselectedItemColor: const Color(0xff1C2031),
      unselectedFontSize: 0,
      selectedFontSize: 0,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
