// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../compenents/dialogbuy.dart';
class Book extends StatefulWidget {
  String image;
  String title;
  int price;
  int stock;
  String author;
  int buyer;
  int id;
   Book({super.key,required this.title,required this.price,required this.stock,required this.author,required this.image,required this.buyer,required this.id});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 153, 24),
      body: Column(
        children: [
          SizedBox(height: 40,),
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 20),
                   child: Stack(
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
                                                                const Color.fromARGB(112, 76, 175, 79))),
                                                    child: Icon(Icons.arrow_back)),
                                              ),
                            ),
                           const Spacer(),
                           const Align(alignment: Alignment.center,child: Text('Import Book',style: TextStyle(fontFamily: 'libre',fontSize: 20),),),
                           const Spacer(),
                          ],
                        ),
                 ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child:Align(alignment: Alignment.bottomCenter,child: Container(height: 500,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(color: const Color.fromARGB(31, 114, 114, 114),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)))
                              ,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Text(widget.title,style: TextStyle(fontFamily: 'libre',fontSize: 40),),
                                  Row(
                                    children: [
                                      Text('By:',style: TextStyle(fontFamily: 'libre',fontSize: 20),),
                                      Text(widget.author,style: TextStyle(fontFamily: 'libre',fontSize: 12,color: Colors.black26),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text('Stock: ',style: TextStyle(fontFamily: 'libre',fontSize: 20),),
                                      Text(widget.stock.toString(),style: TextStyle(fontFamily: 'libre',fontSize: 12,color: Colors.black26),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text('Buyers: ',style: TextStyle(fontFamily: 'libre',fontSize: 20),),
                                      Text(widget.buyer.toString(),style: TextStyle(fontFamily: 'libre',fontSize: 12,color: Colors.black26),),
                                    ],
                                  ),
                                  SizedBox(height: 60,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:30.0,bottom: 20,right: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Price : ${widget.price}DZ',style: TextStyle(fontFamily: 'libre',fontSize: 20),),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () async{
                                            if (widget.stock>=1) {
                                              bool res=await showDialog(context: context, builder:(context) {
                                                return dialogbuy(id: widget.id,);
                                              },)??false;
                                              if (res) {
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('item buyed sucessfuly',style: TextStyle(color: Colors.green),)));
                                                setState(() {
                                                  widget.stock+=-1;
                                                  widget.buyer+=1;
                                                });
                                              }
                                            }
                                          },
                                          child: Container(height: 60,width: 130,decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(40)),child: Center(child: Text('Buy',style: TextStyle(fontFamily: 'libre',fontSize: 24),),),))
                                      ],
                                    ),
                                  ),
                                ],
                              ),)
                              )),
                              Positioned(top: 20,left: MediaQuery.of(context).size.width/2-125,child: SizedBox(height: 300,width: 250,child: Image.network('http://192.168.1.7:8000/${widget.image}',fit: BoxFit.cover,)))
                          ],
                        ),
                      )
              ]),
            ),
          ),
          ),
        ],
      ),
      
    );
  }
}