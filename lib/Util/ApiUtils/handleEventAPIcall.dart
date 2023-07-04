import 'dart:convert';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grand_bazar/Models/bazarEvents.dart';

class HandleAPIcall {
  static late final List<BazarEvents> bazarevents;

  static Future<List<BazarEvents>> getAllevents(String url) async {
    String token = "tsVjmzm0Tz7cN2zKzwFydNP0gGFcrAtNuLo2CHZb";
    //String url =
    //     "https://phpstack-819519-3498170.cloudwaysapps.com/api/v1/bazar-events/get-all";
    http.Response response = await http
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      print(json.decode(response.body));

      // bazarevents = json.decode(response.body) as List<BazarEvents>;
      print(bazarevents);
    }

    return bazarevents;
  }
}
