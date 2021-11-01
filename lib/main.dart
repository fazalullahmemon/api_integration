import 'package:apiintegration/data_provider.dart';
import 'package:apiintegration/insert_data_Screen.dart';
import 'package:apiintegration/posts_screen.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';

void main() {
  runApp(ApiIntegration());
}

class ApiIntegration extends StatelessWidget {
  ApiIntegration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Inegration',
      debugShowCheckedModeBanner: false,
      home: ApiIntegrationHome(),
    );
  }
}

class ApiIntegrationHome extends StatelessWidget {
  ApiIntegrationHome({Key? key}) : super(key: key);
  DataProvider dataProvider = DataProvider();
  Future<List<Data>> getDataFromApi() async {
    List<Data> data = await dataProvider.getData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  List<Data> data = await getDataFromApi();
                  print(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostsScreen(data: data),
                    ),
                  );
                },
                child: Text('Get Data'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InsertDataScreen()));
                },
                child: Text('Insert Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
