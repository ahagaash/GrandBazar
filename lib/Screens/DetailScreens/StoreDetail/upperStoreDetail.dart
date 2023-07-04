import 'package:flutter/material.dart';
import 'package:grand_bazar/Util/constants/colourConstants.dart';

class StoreUpperComponent extends StatelessWidget {
  const StoreUpperComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              closeButtonIcon(context),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/grandbazaarLogo.png'),
                  radius: 60.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(
                  child: Text(
                'Maxcell Mobiles',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 25.0,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            '45',
                            style: TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(color: Colors.black, thickness: 1.5),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            '15',
                            style: TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Offers',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(color: Colors.black, thickness: 1.5),
                    Expanded(
                      flex: 1,
                      child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor,
                          child: MaterialButton(
                            shape: const StadiumBorder(
                              side: BorderSide(color: Colors.black38, width: 1),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            onPressed: () {},
                            child: const Text(
                              'Follow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

closeButtonIcon(BuildContext context) {
  return Align(
    alignment: Alignment.centerRight,
    child: IconButton(
      color: Colors.black,
      iconSize: 28,
      icon: const Icon(Icons.cancel_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
