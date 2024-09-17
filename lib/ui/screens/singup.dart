// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:libraryapp/data/user.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import '../compenents/erordialog.dart';
import 'Homepage.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

ScrollController scrollController=ScrollController();
bool see=true;
final _key=GlobalKey<FormState>();
final con=GlobalKey<FormState>();
final emailcon=TextEditingController();
final passsowrdcon=TextEditingController();
final confirmpasswordcon=TextEditingController();
final usernamecon=TextEditingController();
class _SignupState extends State<Signup> {
   String Get_Eror(Map erors){
    List l=[];
   if (erors.containsKey('username')) {
     l.add(erors['username'][0]+'\n');
   }
   if (erors.containsKey('email')) {
     l.add(erors['email'][0]);
   }
   return l.join();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    passsowrdcon.addListener(() {
      if (con.currentState!=null) {
        con.currentState!.validate();
      }
    });
    confirmpasswordcon.addListener(() {
      if (con.currentState!=null) {
        con.currentState!.validate();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passsowrdcon.clear();
    confirmpasswordcon.clear();
    emailcon.clear();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: Stack(
          children: [
          Positioned.fill(child: Container(
            color:Color.fromARGB(255, 247, 251, 122),
          )),
          Positioned(
            child:DraggableScrollableSheet(maxChildSize: 0.93,minChildSize: 0.93,initialChildSize: 0.93,builder:(context, Controler) {
            return Material(
              color: Color.fromARGB(255, 255, 248, 225),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Align(alignment: Alignment.topCenter,child: Container(height: 5,width: 75,decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(40)),)),
                   SizedBox(height: 10,),
                    ListView(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                         controller: Controler,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:140.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: ElevatedButton(onPressed:() {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    padding:MaterialStatePropertyAll(EdgeInsets.zero),
                                    elevation: MaterialStatePropertyAll(0),
                                    backgroundColor: MaterialStatePropertyAll(Color.fromARGB(201, 254, 226, 147))
                                  ),
                                  child: Icon(Icons.arrow_back)),
                                ),
                                Spacer(),
                                Hero(tag: 'signup',child: Text('Sign Up',style: TextStyle(fontFamily: 'libre',fontSize: 16,color: Colors.black),))
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(alignment: Alignment.topLeft,child: Text('Fill The Details\nTo Sign Up',style: TextStyle(fontFamily: 'libre',fontSize: 30),textAlign: TextAlign.start,)) ,
                          SizedBox(height: 20,),
                           SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: usernamecon,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96))),
                                hintText: 'Entre ur username',
                                prefixIcon: Icon(Icons.person_2_outlined),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96)),borderRadius: BorderRadius.circular(10) ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(90, 48, 154, 10)),borderRadius: BorderRadius.circular(10) ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: emailcon,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96))),
                                hintText: 'Entre ur email',
                                prefixIcon: Icon(Icons.email_outlined),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96)),borderRadius: BorderRadius.circular(10) ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(90, 48, 154, 10)),borderRadius: BorderRadius.circular(10) ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                              controller:passsowrdcon ,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96))),
                                hintText: 'Entre ur password',
                                prefixIcon: Icon(Icons.lock_outline),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96)),borderRadius: BorderRadius.circular(10) ),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(90, 48, 154, 10)),borderRadius: BorderRadius.circular(10) ),
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: IconButton(onPressed: () {
                                  setState(() {
                                    see=!see;
                                  });
                                },icon:see? Icon(Icons.visibility_off_outlined):Icon(Icons.remove_red_eye_outlined)
                                ),
                              ),
                              obscureText: see,
                              validator: (value) {
                                if (value==null || value.isEmpty) {
                                  return 'passsword from 8 char';
                                }else if(value.length<8){
                                  return 'password from 8 char';
                                }else{
                                  return null;
                                }
                              },
                            ),
                        
                          SizedBox(height: 20,),
                          Form(
                            key: con,
                              child: TextFormField(
                                controller: confirmpasswordcon,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96))),
                                  hintText: 'Confrim ur password',
                                  prefixIcon: Icon(Icons.lock_outline),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(43, 96, 96, 96)),borderRadius: BorderRadius.circular(10) ),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(90, 48, 154, 10)),borderRadius: BorderRadius.circular(10) ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      see=!see;
                                    });
                                  },icon:see? Icon(Icons.visibility_off_outlined):Icon(Icons.remove_red_eye_outlined)),
                                ),
                                obscureText: see,
                                validator: (value) {
                                    if (value!=passsowrdcon.text) {
                                    return 'confirm ur passowrd';
                                  }else{
                                    return null;
                                  } 
                                  
                                },
                              ),
                            
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },) ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width/2-175,
            child: GestureDetector(
                            onTap: () async{
                              if (_key.currentState!.validate()) {
                              if (con.currentState!.validate()) {
                                Response m= await signup(usernamecon.text, passsowrdcon.text, emailcon.text);
                                if(m.statusCode==200){
                                  context.read<UserBloc>().add(Getuser(m));
                                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context) => Homepage(),),ModalRoute.withName('splash'));
                                }else{ 
                                  var r=jsonDecode(m.body);
                                  String erormsj= Get_Eror(r);
                                  showDialog(context: context, builder:(context) {
                                    return erordialog(eror: erormsj,);
                                  },);
                                }
                              }
                              }
                            },
                            child: Container(
                              height: 70,
                              width: 350,
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 56, 153, 24),
                              borderRadius: BorderRadius.circular(40)
                              ),
                              child: Center(child: Text('Sign Up',style: TextStyle(fontFamily: 'libre',fontSize: 20),)),
                            ),
                          ))
        
          ],
        ),
      ),
    );
  }
}