// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testsan/components/sidemenu.dart';

class page1 extends StatefulWidget {
  page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Page1')),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextFormFieldModel(labelText: 'username',controller: username,),
              // Text('username :' + username.text),
              TextFormFieldModel(labelText: 'user'),
              // TextFormFieldModel(),
            ],
          )),
          drawer: SideMenu(),
    );
  }
}

class TextFormFieldModel extends StatelessWidget {
  const TextFormFieldModel({
    Key? key, @required this.labelText, this.hintText, this.controller,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      onChanged: (value){
        print(value);
      },
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(100))),

          
          ),
    );
  }
}
