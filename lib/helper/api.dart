import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      log("url: $url data: $data token: $token");

      return data;
    } else {
      throw Exception(
          "there is problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    log("url: $url body: $body token: $token");
    http.Response response =
        await http.post(Uri.parse("uri"), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          "there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ");
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});

    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    print("url: $url body: $body token: $token");

    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print("success $data ");
      return data;
    } else {
      throw Exception(
          "there is problem with status code ${response.statusCode} with body ${jsonDecode(response.body)} ");
    }
  }
}
