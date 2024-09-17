// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/data/books.dart';
import 'package:libraryapp/ui/compenents/sheet.dart';
import 'package:libraryapp/ui/screens/Homepage.dart';
import 'package:libraryapp/ui/screens/book.dart';

import '../../sttman/bloc/explre_bloc.dart';
import 'deletemsj.dart';
class MyBook extends StatefulWidget {
  ScrollController scrollController;
  MyBook({super.key,required this.scrollController});

  @override
  State<MyBook> createState() => _MyBookState();
}

class _MyBookState extends State<MyBook> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
          
          // ignore: prefer_const_literals_to_create_immutables
          children: [
           SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Stack(
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
                                color: const Color.fromARGB(66, 145, 145, 145),
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
                                color: Colors.blue[50],
                              ),
                              child: Center(child: Text('My Books',style: TextStyle(fontFamily: 'libre',fontSize: 12),)),
                            ),
                          )
                        ],
                        ),
                      ),
                    ),
              ],
            ),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:10.0),
             child: Container(
              height: 200,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
              color: Color.fromARGB(255, 56, 153, 24),
              borderRadius: BorderRadius.circular(20),
             ),
             child: Stack(
               children: [
                Positioned(
                top:40,
                left:10,
                child: 
                Text('Read more,\nlearn more,and\ngrow smarter.',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                Positioned(
                  right: 0,
                  child: 
                Image.asset('images/Bibliophile-bro.png',width: 200,height: 200,)),
               ],
             ),
             ),
           ),
           AnimatedOpacity(
             duration: Duration(milliseconds: 700),
             opacity:seeall?1:0,
             child: FutureBuilder(future: getbokk(), builder:(context, snapshot) {
                if(snapshot.hasData){
                List <Bookc> booksuadd =   snapshot.data;
                   if(booksuadd.isEmpty){
                    return Center(child:Text('You dont add any book') ,);
                   }else{
                     return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: booksuadd.length,
              itemBuilder:(context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => Book(title: booksuadd[index].title, price: booksuadd[index].price, stock: booksuadd[index].stock, author: booksuadd[index].author, image: booksuadd[index].cover, buyer: booksuadd[index].buyer,id: booksuadd[index].id,), ));
                    },
                    child: SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Icon(Icons.menu_book_rounded,color: const Color.fromARGB(178, 255, 135, 91),)),
                      ),
                      SizedBox(width: 10,),
                      Align(alignment: Alignment.topLeft,child: Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text(booksuadd[index].title,style: TextStyle(fontFamily: 'libre'),),
                      )),
                      Spacer(),
                      IconButton(onPressed:() async{
                       bool bol=await showDialog(context: context, builder:(context) {
                          return deletemsj(id: booksuadd[index].id,);
                        },)??false;
                        if (bol) {
                          setState(() {
                            Bookc item= booksuadd[index];
                            print(item.title);
                            booksuadd.removeAt(index);
                            
                          });
                        }
                      }, icon: Icon(Icons.delete
                      ,color: Colors.black,))
                    ],
                    ),
                    ),
                  ),
                );
              },);
                   }
               }else{
                return Text('');
               }
             },)
           ),
          ],
          ),
        ),
      ),
    );
  }
}