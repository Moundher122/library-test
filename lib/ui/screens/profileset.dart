// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/data/user.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class profileset extends StatefulWidget {
  const profileset({super.key});

  @override
  State<profileset> createState() => _profilesetState();
}

File? image;
 Future saveImageToLocalStorage(File imageFile) async {
    final directory = await getTemporaryDirectory();
    final String path = '${directory.path}/profile_image.png';
     await imageFile.copy(path);
  }
  Future<File?> loadImageFromCache() async {
    final directory = await getTemporaryDirectory(); 
    final String path = '${directory.path}/profile_image.png'; 
    if (File(path).existsSync()) {
      return File(path); 
    }
    return null; 
  }
bool save=false;
class _profilesetState extends State<profileset> {
  Future pickimage() async {
    final ima = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (ima != null) {
      setState(() {
        image = File(ima.path);
      });
    }
  }
   Future<void> loadCachedImage() async {
    final cachedImage = await loadImageFromCache();
    setState(() {
      image = cachedImage; 
    });
  }
  Future<void> loadCa() async {
    final cachedImage = await loadImageFromCache(); 
      image = cachedImage; 
  }
  @override
  void initState() {
    super.initState();
    save=false;
    loadCachedImage();
  }
  @override
  void dispose() {
    super.dispose();
 if (!save) {
   loadCa();
 }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 251, 122),
      body: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 248, 225),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 2 - 44),
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
                                  padding:
                                      MaterialStatePropertyAll(EdgeInsets.zero),
                                  elevation: MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(201, 254, 226, 147))),
                              child: Icon(Icons.arrow_back)),
                        ),
                        Spacer(),
                        Center(
                            child: Text(
                          'Profile',
                          style: TextStyle(
                              fontFamily: 'libre',
                              fontSize: 16,
                              color: Colors.black),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        pickimage();
                      },
                      child: image == null
                          ? Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                 shape: BoxShape.circle),
                                  child: Center(child: Image.asset('images/image.png',fit:BoxFit.cover)),
                            )
                          : Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Center(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(image!,fit: BoxFit.contain,)),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
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
                                  top: 10.0, left: 10, right: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Email:',
                                          style: TextStyle(
                                              fontFamily: 'libre',
                                              fontSize: 16),
                                        ),
                                        Spacer(),
                                        BlocBuilder<UserBloc, UserState>(
                                          builder: (context, state) {
                                            if (state is Getuserstate) {
                                              return Text(
                                                state.email,
                                                style: TextStyle(
                                                    fontFamily: 'libre',
                                                    fontSize: 12,
                                                    color: Colors.black26),
                                              );
                                            } else {
                                              return Text('');
                                            }
                                          },
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                            color: Colors.black26,
                            endIndent: 20,
                            indent: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, left: 10, right: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children:  [
                                        Text(
                                          'Created :',
                                          style: TextStyle(
                                              fontFamily: 'libre',
                                              fontSize: 16),
                                        ),
                                        Spacer(),
                                        BlocBuilder<UserBloc, UserState>(
                                          builder: (context, state) {
                                            if (state is Getuserstate) {
                                              return Text(
                                              state.created,
                                              style: TextStyle(
                                                  fontFamily: 'libre',
                                                  color: Colors.black26),
                                            );
                                            }else{
                                              return Text('data');
                                            }
                                          },
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () async{
                      if (image != null) {
                       var s=await setprofilepic(image!);
                       if (s.statusCode==200) {
                        save=true;
                         saveImageToLocalStorage(image!);
                       }
                      }
                    },
                    child: Text(
                      'save profile',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'libre',
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
