import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grand_bazar/Screens/EditProfile/editprofile.dart';
import 'package:grand_bazar/Util/ApiUtils/RequestBody/changePassword.dart';

import '../../Util/ApiUtils/Responses/postRequestResponse.dart';
import '../../Util/ApiUtils/controller/userController.dart';
import '../../Util/ApiUtils/sessionManager/userSession.dart';
import '../../Util/constants/apiUserMessageConstants.dart';
import '../Login/login.dart';
import '../dialogs/custom_dialog_box.dart';

class SettingsScreen extends StatefulWidget {
  final UserSession session;
  SettingsScreen({Key? key, required this.session}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      final password = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Column(
            children: [
              Expanded(
                child: IconButton(
                  icon: const Icon(IconlyBroken.arrowLeft2,
                      color: Color.fromARGB(214, 255, 174, 0)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              // Expanded(
              //   child: const Text(
              //     'Back',
              //     style: TextStyle(
              //         color: Color.fromARGB(214, 255, 174, 0), fontSize: 18.0),
              //   ),
              // )
            ],
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(IconlyBroken.editSquare,
                              color: Colors.black),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: InkWell(
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 17.0,
                                    letterSpacing: 1.0),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileScreen()),
                              ),
                            ),
                          ),
                          // SizedBox(width: 150.0),
                          InkWell(
                            child: const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(IconlyBroken.arrowRight2,
                                    color: Colors.black)),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()),
                            ),
                          )
                        ],
                      ),
                      Divider(height: 50.0, color: Colors.grey[600]),
                      Row(
                        children: [
                          const Icon(IconlyBroken.lock, color: Colors.black),
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: InkWell(
                                child: const Text(
                                  'Reset Password',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 17.0,
                                      letterSpacing: 1.0),
                                ),
                                onTap: () => openDialog()),
                          ),
                          // SizedBox(width: 110.0),
                          InkWell(
                            child: const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(IconlyBroken.arrowRight2,
                                    color: Colors.black)),
                            onTap: () => openDialog(),
                          )
                        ],
                      ),
                      Divider(height: 50.0, color: Colors.grey[600]),
                      Row(
                        children: const [
                          Icon(IconlyBroken.notification, color: Colors.black),
                          SizedBox(width: 30.0),
                          Expanded(
                            child: Text(
                              'Notification Setting',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 17.0,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          // SizedBox(width: 80.0),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Icon(IconlyBroken.arrowRight2,
                                  color: Colors.black))
                        ],
                      ),
                      Divider(height: 50.0, color: Colors.grey[600]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Reset Password Modal
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Reset Password'),
            content: TextField(
                controller: _controller,
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Password",
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10))
                )),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Submit'),
                onPressed: () async {
                  PostReqResponse postresponse =
                      await UserController.changePassword(
                          UserPasswordChangeRequest(password: _controller.text),
                          widget.session.customer.id.toString());

                  if (postresponse.status) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialogBox(
                            title: "Sucessfull!",
                            descriptions: userPasswordChanged,
                            text: "OK",
                          );
                        }).whenComplete(() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialogBox(
                            title: "Failed!",
                            descriptions: userPasswordNotChanged,
                            text: "OK",
                          );
                        });
                  }
                },
              ),
            ],
          ));
}
