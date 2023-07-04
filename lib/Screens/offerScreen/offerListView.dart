import 'package:flutter/material.dart';
import 'package:grand_bazar/Models/bazarEvents.dart';
import 'package:grand_bazar/Screens/Cards/bazarTalkCard.dart';
import 'package:grand_bazar/Screens/Home/Components/detailScreen.dart';

import 'package:glass/glass.dart';

class OfferListView extends StatefulWidget {
  const OfferListView({Key? key}) : super(key: key);

  @override
  _OfferListViewState createState() => _OfferListViewState();
}

class _OfferListViewState extends State<OfferListView> {
  //variable
  //demo function test call api from util on live project
  final List<BazarEvents> events = List.generate(
      20,
      (i) => BazarEvents(
            'Offer $i',
            'A description of what needs to be done for offer $i',
          ));
  late final List<BazarEvents> todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: events.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: false,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return BazarTalkCard(
                    event: events[index], events: events[index]);

                // return Card(
                //   clipBehavior: Clip.antiAlias,
                //   child: Column(
                //     children: [
                //       ListTile(
                //         leading: Icon(Icons.arrow_drop_down_circle),
                //         title: Text(events[index].title),
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => DetailScreen(
                //                 event: events[index],
                //                 events: events[index],
                //               ),
                //             ),
                //           );
                //         },
                //         subtitle: Text(
                //           'Secondary Text',
                //           style:
                //               TextStyle(color: Colors.black.withOpacity(0.6)),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Text(
                //           events[index].description,
                //           style:
                //               TextStyle(color: Colors.black.withOpacity(0.6)),
                //         ),
                //       ),
                //       Image.asset('assets/grandbazaarLogo.png'),
                //     ],
                //   ),
                // );
              }),
    );
  }
}
