// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:libraryapp/data/books.dart';
class deletemsj extends StatelessWidget {
  int id;
   deletemsj({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.all(0),
     content: SizedBox(
      height: 150,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Delete',style: TextStyle(fontFamily: 'libre',fontSize: 16),),
          ),
         Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: const Text('Are u sure u want to delete this book?')),
          const Spacer(),
         Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black26))
          ),
          child: Row(
            children: [
              Expanded(child: GestureDetector(onTap: () {
                Navigator.pop(context);
              },child: SizedBox(height: 50,width: 100,child: Center(child: Text('No'),),))),
              Container(height: 50,width: 2,color: Colors.black12,),
              Expanded(child: GestureDetector(
                onTap: () async{
                  var s= await deletebook(id);
                  if (s.statusCode==200) {
                    Navigator.pop(context,true);
                  }
                },
                child: SizedBox(height: 50,width: 100,child: Center(child: Text('Yes',style: TextStyle(color: Colors.red),),),))),
            ],
          ),
         ),
        ],
       ),
     ),
    );
  }
}