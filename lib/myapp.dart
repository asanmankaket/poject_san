import 'package:flutter/material.dart';
import 'package:flutter_testsan/views/page1.dart';

import 'route/route.dart';
import 'views/my_home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: routes,
    );
  }
}