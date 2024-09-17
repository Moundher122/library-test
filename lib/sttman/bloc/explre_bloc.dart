import 'dart:async'; 
import 'package:bloc/bloc.dart';
part 'explre_event.dart';
part 'explre_state.dart';
bool isin=true;
class ExplreBloc extends Bloc<ExplreEvent, ExplreState> {
  ExplreBloc() : super(ExplreInitial()) {
    on<event>(_explore);
  }

  FutureOr<void> _explore(event, Emitter<ExplreState> emit) {
     isin=!isin;
     emit(explr(isin));
  }
}
