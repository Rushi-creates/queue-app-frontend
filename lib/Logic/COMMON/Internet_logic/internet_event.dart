abstract class InternetEvent {}

// we actually dont need initial event, only initial state to pass in super() const of bloc class
class InternetInitialEvent extends InternetEvent {}

class InternetGainEvent extends InternetEvent {}

class InternetLossEvent extends InternetEvent {}



//! Events are the user interactions / or events that can happen on screen , like 
//! or we can say something , we want to write inside onPressed() or onChanged(), onTap() , timely event,etc: 
/*
- clicking on button , and submitting something to api
- user entering something in field ( each word )
- internet connected/lost event
*/

//! this will be our first step in bloc to thing all the possible events of our screen

//? there should always be an extra InitialEvent ( which will occur when that screen loads for the first time)
