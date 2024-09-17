part of 'user_bloc.dart';

sealed class UserEvent {}
 class Getuser extends UserEvent{
  Response h;
  Getuser(this.h);
 }
 class getname extends UserEvent{
  
 }
