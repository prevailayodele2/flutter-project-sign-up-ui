import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning_1/Pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_ulearning_1/Pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvents>((event , emit){
      emit(WelcomeState(page: state.page));
    }); 
  }
}

/*
class state act as a callback function taking two events and a state
and when the bloc class is called it set(update the state)and class the events
to return back the value
*/