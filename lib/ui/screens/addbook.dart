// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:libraryapp/data/books.dart';

class addbook extends StatefulWidget {
   addbook({super.key});

  @override
  State<addbook> createState() => _addbookState();
}

class _addbookState extends State<addbook> {
final titlecon=TextEditingController();

final price=TextEditingController();

final stock=TextEditingController();

final _key=GlobalKey<FormState>();
File ? selectedimage;
final picke=ImagePicker();

bool isNumeric(String s) {
  return int.tryParse(s) != null;
}
Future getimage()async{
  final image= await picke.pickImage(source:ImageSource.gallery );
  setState(() {
    if (image!=null) {
    selectedimage=File(image.path);
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 251, 122),
        body: Column(
          children: [
            SizedBox(height: 40,),
            Expanded(
              child: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(color: Color.fromARGB(255, 255, 248, 225),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
                child: ListView(
                  
                  padding: EdgeInsets.all(0),
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(
                                                    padding: MaterialStatePropertyAll(
                                                        EdgeInsets.zero),
                                                    elevation:
                                                        MaterialStatePropertyAll(0),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromARGB(
                                                                201, 254, 226, 147))),
                                                child: Icon(Icons.arrow_back)),
                                          ),
                        ),
                       const Spacer(),
                       const Align(alignment: Alignment.center,child: Text('Import Book',style: TextStyle(fontFamily: 'libre',fontSize: 20),),),
                       const Spacer(),
                      ],
                    ),
                    const  SizedBox(height: 20,),
                    Align(alignment: Alignment.centerLeft,child: Text('Cover picture',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                   const  SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        getimage();
                      },
                      child:selectedimage==null? DottedBorder(
                        dashPattern: [10,10],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20),
                        child: Center(
                          child: Container(
                            height: 350,
                            width: 300,
                            
                            child: Center(child: Icon(Icons.image),),
                          ),
                        ),
                      ):Image.file(selectedimage!),
                    ),
                    SizedBox(height: 10,),
                    const  Align(alignment: Alignment.centerLeft,child: Text('Your Book Title',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                    TextFormField(
                      validator: (value) {
                        if (value==null || value.isEmpty) {
                          return 'Entre a title';
                        }else{
                          return null;
                        }
                      },
                      controller: titlecon,
                    decoration: InputDecoration(focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const  Align(alignment: Alignment.centerLeft,child: Text('Price',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                            SizedBox(height: 5,),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: price,
                                validator: (value) {
                                  if (value==null || value.isEmpty) {
                                    return 'Entre the price';
                                  }else if(!isNumeric(value)){
                                    return 'contain number only';
                                  }else{
                                    return null;
                                }
                                },
                                                decoration: InputDecoration(focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),suffixText: 'DZD',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                                                ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const  Align(alignment: Alignment.centerLeft,child: Text('Stock',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                            SizedBox(height: 5,),
                            SizedBox(
                              width: 150,
                              child: TextFormField(
                                validator: (value) {
                                  if (value==null ||value.isEmpty) {
                                    return 'Entre Stock';
                                  }else if(!isNumeric(value)){
                                    return 'contain number only';
                                  }else{
                                    return null;
                                  }
                                },
                                controller: stock,
                                                decoration: InputDecoration(focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () async{
                        if (_key.currentState!.validate()) {
                          if(selectedimage==null){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('chose cover image',style: TextStyle(color: Colors.red),)));
                          }else{
                            var k= await  addbookfut(titlecon.text, int.parse(price.text), int.parse(stock.text), selectedimage!);
                            if (k.statusCode==200) {
                              if(context.mounted){
                                Navigator.pop(context,true);
                              }
                            }
                          }
                        }
                      },
                      child: Align(alignment: Alignment.bottomCenter,child: Text('Import',style: TextStyle(height: 0,fontFamily: 'libre',fontSize: 20,color: Colors.green),)))
                  ],
                ),
              ),
              )
              ),
          ],
        ),
      ),
    );
  }
}
