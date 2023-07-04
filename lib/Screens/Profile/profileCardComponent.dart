import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:grand_bazar/Screens/Settings/settings.dart';
import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';

class ProfileCardComponent extends StatelessWidget {
  const ProfileCardComponent({Key? key, required this.userSession})
      : super(key: key);
  final UserSession userSession;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.8,
        decoration: const BoxDecoration(
          color: Color.fromARGB(221, 255, 86, 34),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/grandbazaarLogo.png'),
                  radius: 60.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                  child: Text(
                userSession.customer.fullName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 7.0,
              ),
              Center(
                  child: Text(
                userSession.customer.regionId.toString() +
                    " | " +
                    userSession.customer.areaId.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                height: 25.0,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            '15',
                            style: TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(color: Colors.white, thickness: 1.5),
                    Expanded(
                      child: Column(
                        children: [
                          InkWell(
                              child: const Icon(IconlyBroken.setting),
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsScreen(
                                            session: userSession)),
                                  )),
                          const Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
