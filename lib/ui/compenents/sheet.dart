// ignore_for_file: camel_case_types, prefer_const_constructors, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/data/books.dart';
import 'package:libraryapp/sttman/bloc/explre_bloc.dart';
import '../screens/Homepage.dart';
import 'booktilr.dart';
class shetdraggbale extends StatefulWidget {
  ScrollController scrollController;
   shetdraggbale({
    super.key,
    required this.scrollController,
  });

  @override
  State<shetdraggbale> createState() => _shetdraggbaleState();
}
class _shetdraggbaleState extends State<shetdraggbale> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.all(0),
          controller: widget.scrollController,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: MediaQuery.of(context).size.width/2-25,
                  child: SizedBox(height: 5,child: Container(height: 5,width: 50,decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20)),))),
                Positioned(
                  top: 15,
                  child: SizedBox(
                    height: 40,
                    width: 200,
                    child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ExplreBloc>().add(event());
                        },
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue[50]
                          ),
                          child: Center(child: Text('Explore',style: TextStyle(fontFamily: 'libre',fontSize: 12),)),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          context.read<ExplreBloc>().add(event());
                        },
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(66, 145, 145, 145),
                          ),
                          child: Center(child: Text('My Books',style: TextStyle(fontFamily: 'libre',fontSize: 12),)),
                        ),
                      )
                    ],
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AnimatedDefaultTextStyle(
                      style: TextStyle(),
                      duration: Duration(seconds: 1),
                      child: RichText(text: TextSpan(
                        children: [
                          TextSpan(text:!expend? 'The Most\n':'The Most ',style: TextStyle(color:Color.fromARGB(255, 56, 153, 24),fontSize: 30,fontFamily: 'libre' )),
                          TextSpan(text:'Popular\n',style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'libre')),
                          TextSpan(text:'Books',style: TextStyle(color:Color.fromARGB(255, 56, 153, 24),fontSize: 30,fontFamily: 'libre' )),
                        ]
                      )),
                    ),
                  ),
                ),
                Positioned(
                  top: 182,child:Transform.rotate(angle: pi/2,child: AnimatedOpacity(duration: Duration(milliseconds: 300),opacity: !seeall? 1:0,child: Text('350\nBooks',style: TextStyle(fontFamily: 'libre',fontSize: 30),)))),
                 Align(
                  alignment: Alignment.center,
                   child: AnimatedContainer(
                    duration: Duration(milliseconds: 700),
                    width:!expend? 210:MediaQuery.of(context).size.width,
                    height:!expend? 270:MediaQuery.of(context).size.height-170,
                    transform:!expend? Matrix4.translationValues(MediaQuery.of(context).size.width-300, 0, 0):Matrix4.translationValues(0, 130, 0),
                    child:!expend? ListView(
                      
                    children: [
                      Row(
                        children: [
                          Container(
                        height: 120,
                        width: 98,
                        child: Image.asset('images/2nd.jfif'),
                      ),
                      SizedBox(width:10 ,),
                      Container(
                        height: 120,
                        width: 98,
                        child: Image.asset('images/5th.jfif'),
                      ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                        height: 120,
                        width: 98,
                        child: Image.asset('images/6.jfif'),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 120,
                        width: 98,
                        child: Image.asset('images/firstbook.jpg'),
                      ),
                      
                        ],
                      ),
                    ],):
                        
                         FutureBuilder(future: getbokall(), builder:(context, snapshot) {
                           if (snapshot.hasData) {
                            List <Bookc> m=snapshot.data;
                            return ListView.builder(
                          shrinkWrap: true,
                          itemCount: m.length,
                          itemBuilder:(context, index) {
                          return Booktile(index: index,m: m,);
                             },
                          );
                           }else if(snapshot.connectionState==ConnectionState.waiting
                           ){return Center(child: CircularProgressIndicator(),);}
                           else{
                            return Text('');
                           }
                         },)
                 ),)
              ],
    
            ),
            
          ],
        ),
      ),
    );
  }
}
