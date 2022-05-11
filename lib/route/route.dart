import 'package:flutter/material.dart';
import 'package:flutter_testsan/views/map.dart';
import 'package:flutter_testsan/views/page2.dart';
import 'package:flutter_testsan/views/register.dart';

import '../views/page1.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/page1' :(context) => page1(),
  '/register' :(context) => register(),
  '/page2' :(context) => page2(),
  '/map' :(context) => MapGg(),
};

// Map<String, Widget Function(BuildContext)> routes = { 
//   '/register' :(context) => register(),
// };



