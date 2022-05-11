// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Surname = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();



  DateTime? datenow = DateTime.now();
  String? DropdownValue = 'a';

  List<DropdownMenuItem<String>>? items = [const DropdownMenuItem(value: 'a',child: Text('a'))];
  
  @override
  Widget build(BuildContext context) {
    void newDate() async {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30));
      if (date != null) {
        setState(() {
          datenow = date;
          picdate.text = DateFormat("dd/MM/yyyy").format(date);
          DateFormat("dd/MM/yyyy").format(date);
        });
      }
     
    }
     void newTime() async {
        TimeOfDay? time = await showTimePicker(
            context: context, initialTime: TimeOfDay.now());
        if (time != null) {
          setState(() {
            // datenow = date;
            pictime.text = '${time.hour}:${time.minute}';
            // DateFormat("dd/MM/yyyy").format(date);
          });
        }
      }

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormFieldModel(labelText: 'username', controller: username),
                SizedBox(
                  height: 10,
                ),
                TextFormFieldModel(
                  labelText: 'Password',
                  controller: Password,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormFieldModel(
                  labelText: 'Name',
                  controller: Name,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormFieldModel(
                  labelText: 'Surname',
                  controller: Surname,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormFieldModel(
                  labelText: 'Address',
                  controller: Address,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: picdate,
                  readOnly: true,
                  onTap: () {
                    newDate();
                  },
                  decoration: const InputDecoration(
                    labelText: 'วันที่',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),  
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pictime,
                  readOnly: true,
                  onTap: () {
                    newTime();
                  },
                  decoration: const InputDecoration(
                    labelText: 'เวลา',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(value:  DropdownValue,items: items,onChanged: (value){
                  print(value);
                  setState((){
                     DropdownValue = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'เลือก',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                 ),
                 ElevatedButtonModel(),
                 
                ],
            )),
      ),
    );
  }
}

class TextFormFieldModel extends StatelessWidget {
  const TextFormFieldModel({
    Key? key,
    @required this.labelText,
    this.hintText,
    this.controller,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      onChanged: (value) {
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
            borderSide: BorderSide(
                color: Color.fromARGB(255, 23, 142, 239), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        // prefixIcon: Icon(
        //   Icons.account_circle,
        //   size: 30,
        //   color: Colors.white,
        // )
      ),
    );
    ElevatedButtonModel();
  }
}

class ElevatedButtonModel extends StatelessWidget {
  const ElevatedButtonModel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('สมัครสมาชิก');
        Navigator.pushNamed(
            context, "/register",);
      },
      child: Text('ยืนยันการสมัคร',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        primary: Colors.green,
      ),
    );
  }
}
