import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grand_bazar/Screens/Home/home.dart';
import 'package:grand_bazar/Util/ApiUtils/RequestBody/userLoginRequest.dart';
import 'package:grand_bazar/Util/ApiUtils/controller/userController.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';

import '../../Util/ApiUtils/Responses/loginResponse.dart';
import '../Registration/registration.dart';
import '../dialogs/custom_dialog_box.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  var isLoaded = false;
  var _isObsecured;

  @override
  void initState() {
    super.initState();

    _isObsecured = true;
  }

  //editing controller
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //login function
    void signIn(String mobile, String password) async {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoaded = true;
        });

        LoginResponse loginResponse = await UserController.loginUser(
            UserLoginRequest(phone: mobile, password: password));
        print("eqwfcevewdvwv");
        print(loginResponse.postReqResponse.status);
        if (loginResponse.postReqResponse.status) {
          setState(() {
            isLoaded = false;
          });
          // Container(
          //   child: const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // );

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CustomDialogBox(
                  title: "Sucessfull!",
                  descriptions: "Login sucess",
                  text: "OK",
                );
              }).whenComplete(() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Home(session: loginResponse.userSession)),
              ));
        } else {
          setState(() {
            isLoaded = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const CustomDialogBox(
                  title: "failed  !",
                  descriptions: "Login failed",
                  text: "OK",
                );
              });

          print("LOGIN FAILED");
        }
      }
    }

    //Contact field
    final mobileField = TextFormField(
      autofocus: false,
      controller: mobileController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

        if (value!.isEmpty) {
          return ("contact number is required");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter valid contact");
        }

        return null;
      },
      onSaved: (value) {
        mobileController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mobile Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(2))),
    );

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');

          if (value!.isEmpty) {
            return ("Please enter your password");
          }

          if (!regex.hasMatch(value)) {
            return ("Please Enter valid Password(Min. 6 Characters)");
          }

          return null;
        },
        obscureText: _isObsecured,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              icon: _isObsecured
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObsecured = !_isObsecured;
                });
              },
            ),
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(2))));

    //login button
    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 255, 188, 4),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(30, 15, 20, 20),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(mobileController.text, passwordController.text);
          },
          child: const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoaded
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: kPrimaryColor,
                  size: 200,
                ),
              )
            : Center(
                child: SingleChildScrollView(
                    child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 150,
                                  child: Image.asset(
                                    "assets/grandbazaarLogo.png",
                                    fit: BoxFit.contain,
                                  )),

                              const SizedBox(height: 25),

                              //Label to display top of fields
                              const Text(
                                'Login to your account',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),

                              const SizedBox(height: 25),
                              mobileField,
                              const SizedBox(height: 25),
                              passwordField,
                              const SizedBox(height: 25),
                              loginButton,
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account? "),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistrationScreen()));
                                    },
                                    child: const Text("Sign Up",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 188, 4),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16)),
                                  )
                                ],
                              )
                            ])),
                  ),
                )),
              ));
  }
}
