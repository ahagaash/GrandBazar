import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/DetailScreens/EventDetail/upperEventDetail.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(children: [
              const EventDetailUpperComponent(imgUrl: "assets/expo.jpg"),
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
                            'Dec 21, 2021',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                                letterSpacing: 1.0),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Expo 2020 Dubai',
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
                                    children: const [
                                      Text(
                                        'Date: 2021-10-01',
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 100.0),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Time: 16-00-00',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        const Text(
                          'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
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
