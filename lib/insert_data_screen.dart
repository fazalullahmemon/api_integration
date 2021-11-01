import 'package:apiintegration/data_provider.dart';
import 'package:flutter/material.dart';

class InsertDataScreen extends StatefulWidget {
  const InsertDataScreen({Key? key}) : super(key: key);

  @override
  _InsertDataScreenState createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  DataProvider dataProvider = DataProvider();

  postData() {
    dataProvider.insertData(
        title: titleController.text, body: bodyController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(hintText: 'Title'),
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration: InputDecoration(hintText: 'Body'),
                      keyboardType: TextInputType.multiline,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  postData();
                },
                child: Text('Insert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
