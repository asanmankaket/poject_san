// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_testsan/config/config.dart';
// import 'package:http/http.dart' as http;

import 'page1.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // TextEditingController username = TextEditingController();
  // TextEditingController Password = TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      // appBar: AppBar(
      //   title: Text('ส่วนหัว'),
      //   centerTitle: true,
      //   backgroundColor:Colors.brown[400],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Image.asset(
                'assets/images/santa.png',
                height: 200,
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'ชื่อผู้ใช้',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                        obscureText: hidePassword,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'รหัสผ่าน',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            suffixIcon: IconButton(
                              onPressed: (() {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              }),
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25,
                                color: Colors.white,
                              ),
                            ))),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          print('เข้าสู่ระบบ');
                          Navigator.pushNamedAndRemoveUntil(context, "/page2",(Route<dynamic> route) => false);
                        },
                        child: Text('เข้าสู่ระบบ',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                        )),
                        
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          primary: Colors.red,
                        ),
                        ),
                  SizedBox(height: 10),
                   ElevatedButton(
                        onPressed: () {
                          print('สมัครสมาชิก');
                          Navigator.pushNamedAndRemoveUntil(context, "/register",(Route<dynamic> route) => false);
                        },
                        child: Text('สมัครสมาชิก',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                        )),
                        
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          primary: Colors.red,
                        ),
                          
                          
                        ),
                  ],
                )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// Future chackLogin(String username, String password) async{
//   Uri url = Uri.parse('http://localhost:3000/api/v1/emp/3654');
//   // await http.post(Url,
//   headers:headers,
//   Body: jsonEncode({"username":username, "password": password,}),
    
  
//   )
//     .then((req){

//   });
// }