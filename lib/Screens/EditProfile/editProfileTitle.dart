import 'package:flutter/material.dart';

import '../../Util/constants/colourConstants.dart';

class EditProfileTitle extends StatelessWidget {
  const EditProfileTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 260.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 30.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 23,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 10, 10)),
          ),
        ),
      ),
    );
  }
}
