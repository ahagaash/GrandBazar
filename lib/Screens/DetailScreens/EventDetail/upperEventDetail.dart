import 'package:flutter/material.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';

class EventDetailUpperComponent extends StatelessWidget {
  const EventDetailUpperComponent({Key? key, required this.imgUrl})
      : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 2.8,
          color: kUpperRegistrationColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Image.asset(
              imgUrl,
              alignment: Alignment.topCenter,
              scale: 1,
            ),
          ),
        ),
        closeButtonIcon(context),
      ],
    );
  }
}

closeButtonIcon(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: IconButton(
      color: Colors.white,
      iconSize: 28,
      icon: const Icon(Icons.cancel),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
