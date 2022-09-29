import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseurl = 'https://fakestoreapi.com';

class BaseClient {
  var client = http.Client();
  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseurl + api);
    var headers = {
      "content-Type": "Application/json",
      "connection": "keep-alive"
    };
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseurl + api);
    var payload = jsonEncode(object);
    var headers = {
      "content-Type": "Application/json",
      "connection": "keep-alive"
    };
    var response = await client.post(url, headers: headers, body: payload);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }

// PUT
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseurl + api);
    var payload = jsonEncode(object);
    var headers = {
      "content-Type": "Application/json",
      "connection": "keep-alive"
    };
    var response = await client.put(url, headers: headers, body: payload);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseurl + api);
    var headers = {
      "content-Type": "Application/json",
      "connection": "keep-alive"
    };
    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }
}
