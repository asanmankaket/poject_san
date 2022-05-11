import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
 page3({Key? key, required this.data}) : super(key: key);

final dynamic data;
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page3'),
      ),
      body: Column(children: [
        Text('ชื่อผู้ใช้ ${widget.data['username']}'),
      ]),
    );
  }
}