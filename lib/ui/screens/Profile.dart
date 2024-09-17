// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:libraryapp/data/books.dart';
import 'package:libraryapp/data/user.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import 'package:libraryapp/ui/screens/profileset.dart';
import 'package:libraryapp/ui/screens/welcomepage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            color: Color.fromARGB(255, 247, 251, 122),
          )),
          Positioned(
              child: DraggableScrollableSheet(
            maxChildSize: 0.93,
            minChildSize: 0.93,
            initialChildSize: 0.93,
            builder: (context, Controler) {
              return Material(
                color: Color.fromARGB(255, 255, 248, 225),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20),
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListView(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        controller: Controler,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width / 2 - 44),
                            child: Row(
                              children: [
                                SizedBox(
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
                                Spacer(),
                                Center(
                                    child: Text(
                                  'Settings',
                                  style: TextStyle(
                                      fontFamily: 'libre',
                                      fontSize: 16,
                                      color: Colors.black),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => profileset(),
                                  ));
                            },
                            child: Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          ),
                                          child: image==null?
                                          ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.asset('images/image.png',fit: BoxFit.cover,)):ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.file(image!,fit: BoxFit.cover,))
                                          ,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    BlocBuilder<UserBloc, UserState>(
                                      builder: (context, state) {
                                       if (state is Getuserstate) {
                                          return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.username,
                                              style: TextStyle(
                                                  fontFamily: 'libre',
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              state.email,
                                              style: TextStyle(
                                                  fontFamily: 'libre',
                                                  fontSize: 10,
                                                  color: Colors.black26),
                                            )
                                          ],
                                        );
                                       }else{
                                        return Text('');
                                       }
                                      },
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.arrow_forward_ios_rounded))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'you and us',
                            style: TextStyle(fontFamily: 'libre', fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        
                                      },
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.report_problem_outlined,
                                                  size: 22,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Report Problem',
                                                  style: TextStyle(
                                                      fontFamily: 'libre'),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.black12,
                                  endIndent: 20,
                                  indent: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, left: 10),
                                    child: GestureDetector(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Icon(Icons.star_border_rounded),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Rate Us',
                                                  style: TextStyle(
                                                      fontFamily: 'libre'),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Acounts',
                            style: TextStyle(fontFamily: 'libre', fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10),
                                    child: GestureDetector(
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: GestureDetector(
                                              onTap: () async{
                                                Response m= await lougout();
                                                if(m.statusCode==200){
                                                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context) => 
                                                  WelcomePage(),),ModalRoute.withName('Home'));
                                                }
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.logout_rounded,
                                                    size: 22,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Log Out',
                                                    style: TextStyle(
                                                        fontFamily: 'libre'),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.5,
                                  color: Colors.black12,
                                  endIndent: 20,
                                  indent: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, left: 10),
                                    child: GestureDetector(
                                      onTap: () async{
                                       Response m=await deleteacount();
                                       if (m.statusCode==200) {
                                         exit(0);
                                       }
                                      },
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Delete Acount',
                                                  style: TextStyle(
                                                      fontFamily: 'libre',
                                                      color: Colors.red),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
