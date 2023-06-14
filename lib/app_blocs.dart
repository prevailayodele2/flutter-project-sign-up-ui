import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning_1/app_events.dart';
import 'package:flutter_ulearning_1/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates>{
  AppBlocs():super(InitStates()){
    on<Increment>((event, emit){
      print('i am being called');
      emit(AppStates(counter: state.counter + 1));
      print(state.counter);
    });
    on<Decrement>((event, emit){
      print('i am being called');
      emit(AppStates(counter: state.counter + 1));
      print(state.counter);
    });
  }
}

