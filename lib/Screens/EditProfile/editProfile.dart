import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/Profile/profile.dart';
import 'package:grand_bazar/Screens/Settings/settings.dart';

import '../Registration/registrationTitle.dart';
import '../Registration/upperComponent.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void signUp(String email, String password) async {}

    //Name field
    final nameField = TextFormField(
      autofocus: false,
      // controller: nameController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("User name is required");
        }

        if (!regex.hasMatch(value)) {
          return ("Please Enter valid Name(Min. 3 Characters)");
        }

        return null;
      },
      keyboardType: TextInputType.name,
      onSaved: (value) {
        // nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //Contact field
    final mobileField = TextFormField(
      autofocus: false,
      // controller: mobileController,
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
        // mobileController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mobile Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      // controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Email is required");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Enter a valid email");
        }

        return null;
      },
      onSaved: (value) {
        // emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        // controller: passwordController,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');

          if (value!.isEmpty) {
            return ("Password is required");
          }

          if (!regex.hasMatch(value)) {
            return ("Please Enter valid Password(Min. 6 Characters)");
          }

          return null;
        },
        obscureText: true,
        onSaved: (value) {
          // passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //confirmPassword field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        // controller: confirmPasswordEditingController,
        validator: (value) {
          // if (confirmPasswordEditingController.text.length < 6 ||
          //     passwordController.text != value) {
          //   return ("Password doesn't match");
          // }

          return null;
        },
        obscureText: true,
        onSaved: (value) {
          // confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Confirm Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));

    //sign up button
    final signUpButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 255, 188, 4),
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(30, 15, 20, 20),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            // signUp(emailController.text, passwordController.text);
          },
          child: const Text(
            'Update Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(children: [
              const RegistrationUpperComponent(imgUrl: "assets/register.png"),
              const RegistrationTitleComponent(title: 'Edit Profile'),
              Padding(
                padding: const EdgeInsets.only(top: 320.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Form(
                        // key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          //Label to display top of fields
                          // const Text(
                          //   'Get Started to get live updates',
                          //   textAlign: TextAlign.left,
                          //   style: TextStyle(
                          //       color: Color.fromARGB(255, 0, 0, 0),
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          const SizedBox(height: 20),
                          nameField,
                          const SizedBox(height: 15),
                          mobileField,
                          const SizedBox(height: 15),
                          emailField,
                          const SizedBox(height: 15),
                          passwordField,
                          const SizedBox(height: 15),
                          confirmPasswordField,
                          const SizedBox(height: 15),
                          signUpButton,
                          const SizedBox(height: 15),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     const Text("Already have an account? "),
                          //     GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) =>
                          //                     const SettingsScreen()));
                          //       },
                          //       child: const Text("Login",
                          //           style: TextStyle(
                          //               color: Color.fromARGB(255, 255, 188, 4),
                          //               fontWeight: FontWeight.w700,
                          //               fontSize: 16)),
                          //     )
                          //   ],
                          // )
                        ])),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
