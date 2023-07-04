import 'package:flutter/material.dart';
import '../../../Models/bazarEvents.dart';

import 'package:easy_container/easy_container.dart';

class BazarTalkCardBody extends StatelessWidget {
  const BazarTalkCardBody({Key? key, required this.events}) : super(key: key);

  final BazarEvents events;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyContainer(
        child: Text("Hello World"),
        onTap: () => debugPrint("Hello World"),
        height: 300,
        width: 400,
        showBorder: true,
        borderWidth: 0,
        margin: 1,
        borderRadius: 10,
        borderColor: Color.fromARGB(250, 245, 242, 242),
      ),
    );
  }
}
