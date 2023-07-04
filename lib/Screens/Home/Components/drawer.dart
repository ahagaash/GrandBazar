import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/DetailScreens/EventDetail/eventDetail.dart';
import 'package:grand_bazar/Screens/DetailScreens/JanazaDetail/janazaDetail.dart';
import 'package:grand_bazar/Screens/DetailScreens/OfferDetail/offerDetail.dart';
import 'package:grand_bazar/Screens/DetailScreens/StoreDetail/storeDetail.dart';
import 'package:grand_bazar/Screens/Settings/settings.dart';
import 'package:grand_bazar/Screens/WorkInProgress/WorkInProgressPage.dart';
import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DrawerNavigationBar extends StatelessWidget {
  const DrawerNavigationBar({Key? key, required this.userSession})
      : super(key: key);

  final UserSession userSession;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,

        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              ProfilePicture(
                name: userSession.customer.fullName,
                radius: 50,
                fontsize: 20,
              ),
              Spacer(
                flex: 2, //
              ),
              Text(userSession.customer.fullName),
              Text(userSession.customer.areaId.toString()),
              // Divider(
              //   color: Colors.black,
              //   thickness: 1.5,
              // )
            ]),
            // child: ProfilePicture(
            //   name: 'Fazlan Mohamed',
            //   radius: 15,
            //   fontsize: 15,
            // ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(IconlyBroken.paper),
            title: const Text('Bazar News'),
            tileColor: kPrimaryColor,
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EventDetailScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(IconlyBroken.plus),
            title: const Text('Doctors'),
            iconColor: kPrimaryColor,
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WorkInProgressScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(IconlyBroken.plus),
            title: const Text('Offer'),
            iconColor: kPrimaryColor,
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const OfferDetailScreen()),
              // );
            },
          ),
          ListTile(
            leading: Icon(IconlyBroken.plus),
            title: const Text('Stores'),
            iconColor: kPrimaryColor,
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const OfferDetailScreen()),
              // );
            },
          ),
          ListTile(
            leading: const Icon(IconlyBroken.setting),
            title: const Text('Settings'),
            iconColor: kPrimaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsScreen(session: userSession)),
              );
            },
          ),
        ],
      ),
    );
  }
}
