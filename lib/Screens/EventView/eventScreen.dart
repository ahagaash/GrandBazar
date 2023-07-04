import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/DetailScreens/EventDetail/eventDetail.dart';

class EventViewScreen extends StatefulWidget {
  const EventViewScreen({Key? key}) : super(key: key);

  @override
  State<EventViewScreen> createState() => _EventViewScreenState();
}

class _EventViewScreenState extends State<EventViewScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              for (int x = 1; x <= 5; x++) ...[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventDetailScreen()),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      elevation: 6,
                      shadowColor: const Color.fromARGB(255, 255, 255, 255),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: SizedBox(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/expo.jpg'),
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Expanded(
                                            child: Column(
                                              children: const [
                                                Text(
                                                  'BAZAAR EVENT',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          174, 99, 99, 99)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: const [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  'DEC 21, 2021',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  const Text(
                                    'Expo 2020 Dubai',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
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
                                                      fontSize: 15.0,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: const [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  'Time: 16-00-00',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.grey),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  const Text(
                                    'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Color.fromARGB(255, 133, 131, 131)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
