part of 'explre_bloc.dart';
sealed class ExplreState {}

final class ExplreInitial extends ExplreState {}

class explr extends ExplreState{
  bool isinexplore;
  explr(this.isinexplore);
}
