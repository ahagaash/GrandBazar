import 'package:flutter/material.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';

class ProfileUpperComponent extends StatelessWidget {
  const ProfileUpperComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3.9,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
