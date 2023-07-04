import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/DetailScreens/JanazaDetail/upperJanazaDetail.dart';

import '../../../Util/ApiUtils/model/janazaModel.dart';
import 'package:map_launcher/map_launcher.dart';

class JanazaDetailScreen extends StatefulWidget {
  JanazaDetailScreen({Key? key, required this.janazas}) : super(key: key);

  JanazaModel janazas;

  @override
  State<JanazaDetailScreen> createState() => _JanazaDetailScreenState();
}

class _JanazaDetailScreenState extends State<JanazaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Bottom Popup Modal
    final actionSheet = CupertinoActionSheet(
      title: const Text(
        "Navigate",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      // message: const Text(
      //   "Call Seller",
      //   style: TextStyle(fontSize: 20, color: Color.fromARGB(237, 252, 167, 9)),
      // ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text(
            "View in Google Maps",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(237, 252, 167, 9)),
          ),
          onPressed: () async {
            bool? available = await MapLauncher.isMapAvailable(MapType.google);
            if (available!) {
              await MapLauncher.showMarker(
                mapType: MapType.google,
                coords: Coords(double.parse(widget.janazas.latitude),
                    double.parse(widget.janazas.longitude)),
                title: widget.janazas.personName,
                description: widget.janazas.description,
              );
            }
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text(
          "Cancel",
          style:
              TextStyle(fontSize: 20, color: Color.fromARGB(237, 252, 167, 9)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    //Direction Button
    final directionButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      color: const Color.fromARGB(255, 255, 188, 4),
      child: MaterialButton(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        minWidth: 180,
        onPressed: () {
          showCupertinoModalPopup(
              context: context, builder: (context) => actionSheet);
        },
        child: const Text(
          'Get Direction',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(children: [
              const JanazaDetailUpperComponent(imgUrl: "assets/janaza.jpg"),
              Padding(
                padding: const EdgeInsets.only(top: 260.0),
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
                    padding: const EdgeInsets.all(34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Aug 09, 2021',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                letterSpacing: 1.0),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          widget.janazas.personName,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Burial Date: ' +
                                            widget.janazas.date.month
                                                .toString() +
                                            '/' +
                                            widget.janazas.date.day.toString() +
                                            '/' +
                                            widget.janazas.date.year.toString(),
                                        // 'Burial Date: 2021-08-09',
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 45.0),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Burial Time:' +
                                          widget.janazas.burialTime,
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Location: Malwanahinna',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          "Description",
                          // 'Description',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          widget.janazas.description,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 100.0),
                        Align(
                            alignment: Alignment.centerRight,
                            child: directionButton),
                        const SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
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
