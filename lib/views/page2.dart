// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testsan/views/page3.dart';

import '../components/sidemenu.dart';

class page2 extends StatefulWidget {
  page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
// List<String> s1 = ['','',];

  List<Map<String, String>> items = [
    {'name': 'ซาน', 'age': '21'},
    {'name': 'นัท', 'age': '22'},
    {'name': 'นน', 'age': '87'},
    {'name': 'ซาน', 'age': '21'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Page1')),
      body: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
          onRefresh: () async {},
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) => InkWell(
              onTap: (){
                print('object');
                Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => page3(data: items[i]),
              ),);
              },
              child: Card(
                elevation: 10,
                color: Colors.blue[100],
                child: SizedBox(
                  width: double.maxFinite,
                  // height: 100,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 15, 15, 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/santa.png'),
                          radius: 30,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${items[i]['name']}',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Age : ${items[i]['age']}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    drawer: SideMenu(),
    );
  }
}

