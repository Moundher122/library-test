// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:libraryapp/data/books.dart';
import 'package:libraryapp/ui/screens/book.dart';
class Booktile extends StatelessWidget {
  int index;
  List <Bookc> m;
   Booktile({super.key,required this.index,required this.m});
  List<Color?> color=[Colors.amber[100],const Color.fromARGB(178, 255, 135, 91),const Color.fromARGB(208, 214, 237, 159)];
  @override
  
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder:(context) => Book(title: m[index].title, price: m[index].price, stock:m[index].stock, author: m[index].author, image: m[index].cover, buyer: m[index].buyer,id: m[index].id,), ));
      },
      child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical:10.0),
                                        child: SizedBox(
                                          height: 200,
                                          width: MediaQuery.of(context).size.width,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 8,
                                                left: 8,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    color: color[index%3],
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: SizedBox(
                                                        width: 200,
                                                        height: 20,
                                                        child: FittedBox(child: Align(alignment: Alignment.centerLeft,child: Text(m[index].title,style: TextStyle(fontFamily: 'libre',fontSize: 20),)))),
                                                    ),
                                                  ),
                                                ),
                                                )),
                                                Positioned(
                                                top: 0,
                                                right: 30,
                                                child:SizedBox(height: 170,width: 120,child: Image.network('http://192.168.1.7:8000/${m[index].cover}',fit: BoxFit.cover,),)),
                                            ],
                                          ),
                                        ),
                                      ),
    );
  }
}