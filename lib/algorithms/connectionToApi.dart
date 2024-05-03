// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ConnectionToApi {
  ///get response body from API
  dynamic getApi(String urlGitApi) async {
    try {
      var response = await http.get(Uri.parse(urlGitApi));
      if (response.statusCode == 200) {
        return response;
      } else {
        if (kDebugMode) {
          print('Error: ${response.reasonPhrase}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: not Internet on your device!');
      }
      return null;
    }
  }

  /// get data all books from API
  Future<List<dynamic>> getBooksDataApi(String urlGitApi) async {
    var response = await getApi(urlGitApi);
    if (response != null) {
      List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      return [];
    }
  }

  /// get data only one book from API
  Future<Map<String, dynamic>> getBookDataApi(String urlGitApi) async {
    var response = await getApi(urlGitApi);
    if (response != null) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      return {};
    }
  }
}
