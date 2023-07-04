import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:grand_bazar/Screens/EventView/eventScreen.dart';
import 'package:grand_bazar/Screens/Home/Components/homeListView.dart';
import 'package:grand_bazar/Screens/Home/Components/drawer.dart';
import 'package:grand_bazar/Screens/JanazaNewsView/janazaView.dart';
import 'package:grand_bazar/Screens/Profile/profile.dart';
import 'package:grand_bazar/Screens/offerScreen/offerListView.dart';
import 'package:grand_bazar/Screens/offers/offers.dart';
import 'package:grand_bazar/Screens/stores/stores.dart';
import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Home extends StatefulWidget {
  final UserSession session;
  Home({Key? key, required this.session}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late UserSession user;
  late List<Widget> widgets;

  void initState() {
    super.initState();
    user = widget.session;
    widgets = _widgetOptions();
  }

  String _pageTitle = "";
  Color appabarcolour = Colors.white;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions() {
    return [
      EventViewScreen(),
      OfferScreen(),
      JanazaViewScreen(userSession: user),
      TabScreen(),
      ProfileScreen(session: user)
    ];
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _pageTitle = '';
        appabarcolour = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        _pageTitle = 'Offer';
        appabarcolour = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        _pageTitle = 'Janaza';
        appabarcolour = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        _pageTitle = 'Shops';
        appabarcolour = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        _pageTitle = 'profile';
        appabarcolour = kPrimaryColor;
      });
    }

    setState(() {
      _selectedIndex = index;
      user = widget.session;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appabarcolour,
          title: Text(_pageTitle, style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(IconlyBroken.notification),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ]),

      //BODY

      body: widgets.elementAt(_selectedIndex),

      //DRAWER
      drawer: DrawerNavigationBar(
        userSession: user,
      ),

      //BOTTOM NAVIGATION BAR

      bottomNavigationBar: GNav(
          // rippleColor: Colors.grey, // tab button ripple color when pressed
          // hoverColor: Colors.grey, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          // tabActiveBorder:
          //     Border.all(color: Colors.black, width: 1), // tab button border
          // tabBorder:
          //     Border.all(color: Colors.grey, width: 1), // tab button border
          // tabShadow: [
          //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          // ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          onTabChange: (value) => {_onItemTapped(value)},
          color: Colors.black, // unselected icon color
          activeColor:
              Color.fromARGB(255, 232, 191, 9), // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Color.fromARGB(255, 238, 176, 6)
              .withOpacity(0.3), // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 15), // navigation bar padding
          tabs: [
            GButton(
              icon: IconlyBroken.home,
              text: 'Home',
            ),
            GButton(
              icon: IconlyBroken.discount,
              text: 'Offers',
            ),
            GButton(
              icon: IconlyBroken.document,
              text: 'Janaza',
            ),
            GButton(
              icon: IconlyBroken.bag2,
              text: 'Shops',
            ),
            GButton(
              icon: IconlyBroken.profile,
              text: 'Profile',
            )
          ]),
    );
  }
}
