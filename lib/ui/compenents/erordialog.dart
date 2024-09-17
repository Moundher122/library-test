// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class erordialog extends StatelessWidget {
  String eror;
   erordialog({super.key,required this.eror});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:const EdgeInsets.all(0),
      content: Container(
        height: 170,
        decoration:BoxDecoration(
          color: const Color.fromARGB(207, 15, 14, 14),
          borderRadius: BorderRadius.circular(26)
        ) ,
        child: Column(
          children: [
            Center(child: Text('Eror',style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 202, 202, 202)),),),
            SizedBox(height: 20,),
            Text(eror,style: TextStyle(color: const Color.fromARGB(255, 202, 202, 202)),),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(height: 50,decoration: BoxDecoration(border: Border(top: BorderSide(color:const Color.fromARGB(255, 202, 202, 202) ))),
              child: Center(child: Text('Ok',style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 202, 202, 202)),)),),
            )
          ],
        ),
      ),
    );
  }
}