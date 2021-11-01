import 'package:flutter/material.dart';

import 'data_model.dart';

class PostsScreen extends StatefulWidget {
  final List<Data> data;
  PostsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: List.generate(
                  widget.data.length,
                  (index) => Text(
                    widget.data[index].title,
                    maxLines: 1,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
