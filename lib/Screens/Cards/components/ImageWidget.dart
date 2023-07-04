import 'package:flutter/material.dart';

import 'package:glass/glass.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        padding: EdgeInsets.all(16),
        child: DropShadowImage(
          image: Image.network(
            url,
            fit: BoxFit.fill,

            //alignment: Alignment.topCenter,
            scale: 1,
            // height: 500,
            // width: 200,
            frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) =>
                wasSynchronouslyLoaded
                    ? child
                    : AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeOut,
                      ),
            loadingBuilder: (context, child, progress) => progress == null
                ? child
                : LinearProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
                  ),
            errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) =>
                Text('Failed to load image'),
          ),
          offset: Offset(10, 10),
          scale: 1,
          blurRadius: 0,
          borderRadius: 20,
        ));
  }
}
