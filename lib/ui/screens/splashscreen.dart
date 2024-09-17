// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/sttman/bloc/user_bloc.dart';
import 'package:libraryapp/ui/screens/Homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'welcomepage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    await Future.delayed(const  Duration(milliseconds: 1800));
    context.read<UserBloc>().add(getname());
    final pre= await   SharedPreferences.getInstance();
    bool s=pre.getBool('isloged')??false;
    if (context.mounted&& !s) {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => const WelcomePage(),));
    }else if(context.mounted){
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>  Homepage(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('images/background.png',fit: BoxFit.cover,)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Text('Books hub',style: TextStyle(fontSize: 34,fontFamily: 'blasiq'),),
                 Text('read your favorite book anytime evreywhere')
              ],
            ),
          ),
        ],
      ),
    );
  }
}