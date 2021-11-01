import 'dart:convert';

import 'package:apiintegration/data_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  Future<List<Data>> getData() async {
    Response? response;
    List<Data> data = [];
    response = await http.get(url);
    if (response.statusCode == 200) {
      List<Data> data = dataFromJson(response.body);
      return data;
    } else {
      return data;
    }
  }

  insertData({
    required String title,
    required String body,
  }) async {
    Response response;
    response = await http.post(url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "userId": 1,
          "title": title,
          "body": body,
        }));
    print(response.body);
  }
}
