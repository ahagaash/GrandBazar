import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Util/ApiUtils/model/offersModel.dart';
import '../../Util/ApiUtils/services/offersService.dart';
import '../Cards/components/ImageWidget.dart';
import '../DetailScreens/OfferDetail/offerDetail.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  int? length;

  List<OfferModel>? offers;

  var isLoaded = false;
  void initState() {
    super.initState();

    getJanazaNews();
  }

  getJanazaNews() async {
    print("testing  111111111111---)");
    offers = await OffersService().getOffers();

    print("test data--- scope --");
    print(offers![0]?.description);

    if (offers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //login function

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // ignore: unrelated_type_equality_checks
          child: offers != null
              ? ListView(
                  children: [
                    for (int x = 0; x < offers!.length; x++) ...[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 5.0, right: 5.0),
                        child: SizedBox(
                          height: 135,
                          child: InkWell(
                                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                             
                                OfferDetailScreen(offers: offers![x])),
                    );
                  },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 10,
                              shadowColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: SizedBox(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    children: [
                                      Banner(
                                        message:
                                            offers![x].percentage + ' discount',
                                        location: BannerLocation.topEnd,
                                        color: Color.fromARGB(209, 255, 230, 0),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          // child: Image.asset('assets/stores/store3.jpg'),
                                          // child: AspectRatio(
                                          // aspectRatio: 16 / 9, //aspect ratio for Image
                                          // child: Image(
                                          //   image: AssetImage('assets/stores/store3.jpg'),
                                          //   fit: BoxFit
                                          //       .fill, //fill type of image inside aspectRatio
                                          // ),
                                          child: Container(
                                            child: const NetworkImageWidget(
                                                url:
                                                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 30.0,
                                            bottom: 10.0,
                                            right: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              offers![x].title,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 13.0,
                                            ),
                                            Text(
                                              offers![x].store.name,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Color.fromARGB(141, 0, 0, 0),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            const SizedBox(
                                              height: 13.0,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    'Rs 199.99',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color.fromARGB(
                                                          141, 0, 0, 0),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    offers![x]
                                                            .endDate
                                                            .month
                                                            .toString() +
                                                        '/' +
                                                        offers![x]
                                                            .endDate
                                                            .day
                                                            .toString() +
                                                        '/' +
                                                        offers![x]
                                                            .endDate
                                                            .year
                                                            .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 11.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromARGB(
                                                            141, 0, 0, 0)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ],
                )
              :

              // const Text("lodaing........")
              const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
