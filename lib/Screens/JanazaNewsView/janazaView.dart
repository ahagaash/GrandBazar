import 'package:flutter/material.dart';
import 'package:grand_bazar/Screens/DetailScreens/JanazaDetail/janazaDetail.dart';
import 'package:grand_bazar/Util/ApiUtils/controller/janazaController.dart';
import 'package:grand_bazar/Util/ApiUtils/model/janazaModel.dart';
import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../Util/ApiUtils/services/janazaService.dart';
import '../Cards/components/ImageWidget.dart';

class JanazaViewScreen extends StatefulWidget {
  const JanazaViewScreen({Key? key, required this.userSession})
      : super(key: key);
  final UserSession userSession;
  @override
  State<JanazaViewScreen> createState() => _JanazaViewScreenState();
}

class _JanazaViewScreenState extends State<JanazaViewScreen> {
  int? length;
  List<JanazaModel>? janazas;

  var isLoaded = false;
  void initState() {
    super.initState();

    getJanazaNews();
  }

  getJanazaNews() async {
    janazas = await JanazaService().getJanazas();

    if (janazas != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: janazas?.length,
            itemBuilder: (context, index) {
              Divider(
                thickness: 5,
                color: Colors.grey[300],
              );

              return Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              JanazaDetailScreen(janazas: janazas![index])),
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
                          Container(
                            child: const NetworkImageWidget(
                                url:
                                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                          ),
                          // Image.asset('assets/janaza.jpg'),
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
                                            children: [
                                              Text(
                                                janazas![index].personName,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        174, 99, 99, 99)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                janazas![index].burialTime,
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
                                Text(
                                  janazas![index].personName,
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
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
                                                    janazas![index]
                                                        .date
                                                        .month
                                                        .toString() +
                                                    '/' +
                                                    janazas![index]
                                                        .date
                                                        .day
                                                        .toString() +
                                                    '/' +
                                                    janazas![index]
                                                        .date
                                                        .year
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        174, 99, 99, 99)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                'Burial Time:' +
                                                    janazas![index].burialTime,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        174, 99, 99, 99)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12.0),
                                Text(
                                  janazas![index].address,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  janazas![index].description,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 15.0,
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
              );
            },
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
