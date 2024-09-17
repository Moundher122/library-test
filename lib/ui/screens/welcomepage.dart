// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:libraryapp/ui/screens/login.dart';

import 'singup.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
bool apear=false;
class _WelcomePageState extends State<WelcomePage> {
  @override
  void didChangeDependencies() async{
    
    super.didChangeDependencies();
    await  Future.delayed(Duration(milliseconds: 100));
    setState(() {
      apear=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 251, 122),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Transform.translate(
                    offset: Offset(-25, -25),
                    child: AnimatedContainer(
                      width:apear? 150:0,
                      height:apear? 150:0,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                      duration: Duration(milliseconds: 500),
                      child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/firstbook.jpg',fit: BoxFit.cover,)),
                    ),
                  ),
                ),
                Positioned(
                  right: 80,
                  top: 10,
                  child: AnimatedContainer(
                    width:apear? 100:0,
                    height:apear? 100:0,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                    duration: Duration(milliseconds: 1000),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/2nd.jfif',fit: BoxFit.cover,)),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 105,
                  child: AnimatedContainer(
                    width:apear? 150:0,
                    height:apear? 150:0,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                    duration: Duration(milliseconds: 600),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/3rd.jfif',fit: BoxFit.cover,)),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 150,
                  child: Transform.translate(
                    offset: Offset(50, 0),
                    child: AnimatedContainer(
                      width:apear? 130:0,
                      height:apear? 130:0,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                      duration: Duration(milliseconds: 500),
                      child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/5th.jfif',fit: BoxFit.cover,)),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 230,
                  child: AnimatedContainer(
                    width:apear? 60:0,
                    height:apear? 60:0,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                    duration: Duration(milliseconds: 500),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/6.jfif',fit: BoxFit.cover,)),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 300,
                  child: AnimatedContainer(
                    width:apear? 150:0,
                    height:apear? 150:0,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black,),
                    duration: Duration(milliseconds: 500),
                    child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/4th.jpg',fit: BoxFit.cover,)),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 380,
                  child: Text('The \n Bigesst',style: TextStyle(fontSize: 45,fontFamily: 'libre'),))
              ],
            ),
          ),
          SizedBox(child: Transform.rotate(angle: 0.17,child: FittedBox(fit: BoxFit.cover,child: Text('Books collection',style: TextStyle(fontSize: 100,fontFamily: 'libre',height: 0))))),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: SizedBox(child: Transform.rotate(angle: 0.17,child: Text('Evreyone will find a book \n according to his prefrences',textAlign: TextAlign.center),),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) =>login() ,));
                  },
                  child: Container(
                    height: 65,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:BorderRadius.circular(40)
                    ),
                    child: Hero(tag: 'log',child: Center(child: Text('Log In',style: TextStyle(fontFamily: 'libre',fontSize: 16,color: Colors.black),))),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) =>Signup() ,));
                  },
                  child: Container(
                    height: 65,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius:BorderRadius.circular(40)
                    ),
                    child: Center(child: Hero(tag: 'signup',child: Text('Sign Up',style: TextStyle(fontFamily: 'libre',fontSize: 16,color: Colors.black),))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}