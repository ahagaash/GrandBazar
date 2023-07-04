import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/Cards/components/ImageWidget.dart';
import 'package:grand_bazar/Screens/Cards/components/bazarTalkCardBody.dart';

import '../../Models/bazarEvents.dart';

import 'package:glass/glass.dart';

class BazarTalkCard extends StatelessWidget {
  const BazarTalkCard(
      {Key? key, required this.events, required BazarEvents event})
      : super(key: key);

  final BazarEvents events;

  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          NetworkImageWidget(
              url:
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
          BazarTalkCardBody(events: events)
        ],
      ),
    );
  }
}
