import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Logic/COMMON/Internet_logic/internet_event.dart';
import 'package:no_queue2/Logic/COMMON/Internet_logic/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
/* -------------------------------------------------------------------------- */
/*                 //! other classes init/object creation here                */
/* -------------------------------------------------------------------------- */
  Connectivity _connectivity = Connectivity();

  StreamSubscription?
      connectivitySubscription; //this is only used for the listen method of connectivity package

  //Note : super() is constructor of inherited class
  // ( and we pass the initial state of our bloc inside this const)
  // and InternetBloc() is normal constructor of our dart class
  InternetBloc() : super(InternetInitialState()) {
    //! first we assign , on what  event occured , what state should be emitted
//* on<Event1>((event, emit) => State1());   //syntax
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));
    on<InternetLossEvent>((event, emit) => emit(InternetLossState()));

    //! here write our business logic ( where we return events, and it will
    //! automatically return corresponding state based on above)
    //we use conditional if statements , to return required Event , using add() method based on Biz logic

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainEvent()); //! we use add method to return events , based on logic
      } else {
        add(InternetLossEvent()); //based on above const , it will return
      }
    });
  }

  //! to close anything on screen closes ( which uses this bloc class)
  @override
  Future<void> close() {
    //todo: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}

//! this class is used to make connection between events and state
//! on certain logic , in if condition , we return an event ( which will automatically emit its corresponding state)

//! in UI class , we write multiple if(s), for multiple states
/*
if(state is State1){return widget1}
else if ( state is State2){return widget2}
else if ( state is State3){return widget3}
else {return widget2}
*/
//! we dont check for events in UI , just return one widget , for each possible state ( using if conditions)

//! so UI is independent of events , as it only depends on state ( where we return each widget for each posible state)

//!  IMP
//UI uses state
//biz logic uses events
//both are connected in constructor of bloc class ( means which state to emit on which event)
