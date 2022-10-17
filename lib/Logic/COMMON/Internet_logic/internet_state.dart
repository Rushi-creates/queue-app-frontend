abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainState extends InternetState {}

class InternetLossState extends InternetState {}


//! Now create every possible state( possible screen UIs ) for each event :
//! state means UI of screen on a specific time like :
/*
- on error event show error state screen
- on loading event show loading state screen
- on wrong validation, show red text on screen
*/
//! on state changed, doesnt need to be replaced by whole screen, it can also be replaced by only some part of screen



// there can be multiple states for single event in bloc
//? there should always be an extra InitialState ( which will be shown when that screen loads for the first time)