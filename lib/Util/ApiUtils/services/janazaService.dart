import 'dart:convert';

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grand_bazar/Models/bazarEvents.dart';

import '../model/janazaModel.dart';
import '../model/storeModel.dart';

class JanazaService {

  Future<List<JanazaModel>?> getJanazas() async {

    String token = "tsVjmzm0Tz7cN2zKzwFydNP0gGFcrAtNuLo2CHZb";

    var client = http.Client();

    var uri = Uri.parse(
        'https://phpstack-819519-3498170.cloudwaysapps.com/api/v1/janaza-news/get-all');
    var response =
        await client.get(uri, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);

      final rawData = decodeData['data'];
      final encodeData = jsonEncode(rawData);

      return janazaModelFromJson(encodeData);
    }
  }
}
