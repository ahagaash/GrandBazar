import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:grand_bazar/Screens/DetailScreens/OfferDetail/upperOfferDetail.dart';

import '../../../Util/ApiUtils/model/offersModel.dart';

class OfferDetailScreen extends StatefulWidget {
  OfferDetailScreen({Key? key, required this.offers}) : super(key: key);

  OfferModel offers;

  @override
  State<OfferDetailScreen> createState() => _OfferDetailScreenState();
}

class _OfferDetailScreenState extends State<OfferDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Bottom Popup Modal
    final actionSheet = CupertinoActionSheet(
      title: const Text(
        "Action",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      // message: const Text(
      //   "Call Seller",
      //   style: TextStyle(fontSize: 20, color: Color.fromARGB(237, 252, 167, 9)),
      // ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text(
            "Call Seller",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(237, 252, 167, 9)),
          ),
          onPressed: ()async {
              //  await FlutterPhoneDirectCaller.callNumber(widget.offers.store.phone);
              await FlutterPhoneDirectCaller.callNumber("0774782111");
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
    final ContactSellerButton = Material(
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
          'Contact Seller',
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
              const OfferDetailUpperComponent(
                  imgUrl: "assets/dominosOffer.jpg"),
              Padding(
                padding: const EdgeInsets.only(top: 240.0),
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            // child: SizedBox(
                            //   height: 100,
                            //   child: Image.asset(
                            //     "assets/dominos.png",
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            ),
                        const SizedBox(height: 0.5),
                        Center(
                          child: Text(
                            widget.offers.store.name,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 12),
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
                          widget.offers.title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600),
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
                                        'Start Date : ' +
                                            widget.offers.startDate.year
                                                .toString() +
                                            '-' +
                                            widget.offers.startDate.month
                                                .toString() +
                                            '-' +
                                            widget.offers.startDate.day
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 14.0, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 77.0),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'End Date : ' +
                                          widget.offers.endDate.year
                                              .toString() +
                                          '-' +
                                          widget.offers.startDate.month
                                              .toString() +
                                          '-' +
                                          widget.offers.startDate.day
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.grey),
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
                        Text(
                          widget.offers.description,
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        const SizedBox(height: 40.0),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ContactSellerButton),
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
