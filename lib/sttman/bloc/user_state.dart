part of 'user_bloc.dart';
sealed class UserState {}
final class UserInitial extends UserState {
  
}
class Getuserstate extends UserState{
 String username;
 String email;
 String created;
 Getuserstate(this.username,this.email,this.created);
}