import 'package:flutter/material.dart';
import 'package:grand_bazar/Models/bazarEvents.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key, required this.events, required BazarEvents event})
      : super(key: key);

  final BazarEvents events;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(events.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(events.description),
      ),
    );
  }
}
