import 'package:flutter/material.dart';
import 'package:grand_bazar/Models/bazarEvents.dart';
import 'package:grand_bazar/Screens/Home/Components/detailScreen.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  //variable
  //demo function test call api from util on live project
  final List<BazarEvents> events = List.generate(
      20,
      (i) => BazarEvents(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ));
  late final List<BazarEvents> todo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: events.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Card(
                  //clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Image.asset('assets/grandbazaarLogo.png'),
                      ListTile(
                        title: Text(events[index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                event: events[index],
                                events: events[index],
                              ),
                            ),
                          );
                        },
                        subtitle: Text(
                          events[index].title,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          events[index].description,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
