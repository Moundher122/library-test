import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  String email='';
  String username='';
  String created='';
  UserBloc() : super(UserInitial()) {
  on<Getuser>(_getuser );
  on<getname>(_setnaame);
  }

  FutureOr<void> _getuser(Getuser event, Emitter<UserState> emit) async{
    var a=jsonDecode(event.h.body);
    var data=a['user'];
    String time=a['created'];
    String s='';
    for (var i in time.characters) {
      if (i=="T") {
        break;
      }else{
        s=s+i;
      }
    }
    final pref=await SharedPreferences.getInstance();
    await pref.setString('email',data['email']);
    await pref.setString('username',data['username']);
    await pref.setString('created',s);
    emit(Getuserstate(data['username'], data['email'],s));
  }

  FutureOr<void> _setnaame(getname event, Emitter<UserState> emit) async{
    final pref=await SharedPreferences.getInstance();
    email=pref.getString('email')??'';
    username=pref.getString('username')??'';
    created=pref.getString('created')??'';
    emit(Getuserstate(username, email,created));
  }
}
