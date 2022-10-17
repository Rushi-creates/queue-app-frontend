// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:no_queue2/Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// import '../../../Repository_layer/UserAcc_repo.dart';
// import '../../../service_layer/models/UserAcc.dart';
// import '../QueueUser_cud_screen.dart';
// import 'About_queue_card_widget.dart';
// // 
// //to change class name = right click on className> Rename symbol
// class QueueUser_firebase_fetchProp_Screen extends StatefulWidget {
//   final admin_QueueObj;
//   final fromDiffProfile;
//   final currentQueueUserObj;

//   const QueueUser_firebase_fetchProp_Screen(
//       {this.admin_QueueObj,
//       this.currentQueueUserObj,
//       required this.fromDiffProfile,
//       Key? key})
//       : super(key: key);

//   const QueueUser_firebase_fetchProp_Screen.admin_QueueObj(
//       {required this.admin_QueueObj,
//       required this.fromDiffProfile,
//       this.currentQueueUserObj});

//   const QueueUser_firebase_fetchProp_Screen.fromCurrentQueues(
//       {this.admin_QueueObj,
//       this.fromDiffProfile,
//       required this.currentQueueUserObj});

//   @override
//   _QueueUser_firebase_fetchProp_ScreenState createState() =>
//       _QueueUser_firebase_fetchProp_ScreenState();
// }

// class _QueueUser_firebase_fetchProp_ScreenState
//     extends State<QueueUser_firebase_fetchProp_Screen> {
//   var storeId_user;
//   // var storeId_admin;
//   var storeYourTurn;

//   @override
//   void initState() {
//     super.initState();
//     getMyUser();
//     // getMyAdmin();
//   }

//   getMyUser() async {
//     UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
//     UserAcc? myUser = await userAcc_sp_repo.spGet_UserAccObj();
//     storeId_user = myUser?.id;
//   }

//   // getMyAdmin() async {
//   //   AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();
//   //   AdminAcc? myAdmin = await adminAcc_sp_repo.spGet_AdminAccObj();
//   //   storeId_admin = myAdmin?.id;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       appBar: myHeader(),
//       body: myBody(),
//       floatingActionButton:
//           widget.fromDiffProfile == null || widget.currentQueueUserObj != null
//               ? Container()
//               : myFab(),
//     );
//   }

//   myBody() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // (dummyList),
//           // aboutShopCard(),
//           fetchStreamCollec_QueueUser(),
//         ],
//       ),
//     );
//   }

// //   aboutShopCard() {
// //     var dimVar = MediaQuery.of(context).size;

// // //height : dimVar.height*0.5    //to access height
// // //width : dimVar.width*0.5       //acces width
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
// //       child: SizedBox(
// //         width: dimVar.width, //acces width
// //         child: Card(
// //           child:
// //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 23, 23.0, 10),
// //               child: Text(
// //                 "About this Queue:",

// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 20.0,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
// //               child: Text(
// //                 "This queue is from shop : ",
// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   // fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 13.0,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
// //               child: Text(
// //                 'Max number of people who can join this queue:',
// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   // fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 13.0,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
// //               child: Text(
// //                 'Note : Queue is closed to join',
// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   // fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 13.0,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
// //               child: Text(
// //                 'You joined the queue at this time : ',
// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   // fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 13.0,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
// //               child: Text(
// //                 'Your id for this queue is : ',
// //                 // maxLines: 2,
// //                 // overflow: TextOverflow.ellipsis,
// //                 // textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                   // decoration: TextDecoration.none,
// //                   // fontStyle: FontStyle.italic,
// //                   // fontFamily: "FontNameHere" ,
// //                   // fontWeight: FontWeight.bold,
// //                   // fontWeight: FontWeight.w300,
// //                   fontSize: 13.0,
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //           ]),
// //         ),
// //       ),
// //     );
// //   }

// /* -------------------------------------------------------------------------- */
// /*                           //@ Firebase fetch list                          */
// /* -------------------------------------------------------------------------- */

//   fetchStreamCollec_QueueUser() {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('QueueUser')
//             .where('queue_fk',
//                 isEqualTo: widget.currentQueueUserObj != null
//                     ? widget.currentQueueUserObj.queue_fk
//                     : widget.admin_QueueObj.id)
//             .orderBy('joinedTime', descending: false)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             Center(child: Text("Something went wrong: ${snapshot.error}"));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Center(child: CircularProgressIndicator()),
//             );
//           }

//           if (snapshot.data == null) {
//             return Text("No data yet");
//           }

//           /* -------------------------------------------------------------------------------------- */
//           /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
//           /* -------------------------------------------------------------------------------------- */

//           final List docsListName = [];

//           snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map a = document.data() as Map<String, dynamic>;
//             docsListName.add(a);

//             /* -------------------------------------------------------------------------- */
//             /*    //! storing name/id of document , inside its own doc body , as a key    */
//             /* -------------------------------------------------------------------------- */
//             //this 'idKEY' string is imp , use it as actual arg, to pass in delete,update crud
//             a['idKEY'] = document.id;
//           }).toList();

//           //write any other req logic here to manipulate docsListName , before displaying

//           /* -------------------------------------------------------------------------- */
//           /*  //? displaying all key-values , from docNameList , using ListView.builder */
//           /* -------------------------------------------------------------------------- */

//           //! TO STORE INDEX
//           storeYourTurn = docsListName
//               .indexWhere((element) => element['userAcc_fk'] == storeId_user);

//           //Todo: change UI here , and display data as req
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 // queueStatistics(docsListName),

//                 //! kinda wrong data passed
//                 // AboutShopCard(
//                 //   docsListName: docsListName,
//                 //   prevQueueObj: widget.admin_QueueObj == null
//                 //       ? widget.currentQueueUserObj
//                 //       : widget.admin_QueueObj,
//                 // ),

//                 firstThreePerson(docsListName),
//                 statistics_section2(docsListName),
//                 Divider(),
//                 Card(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         LiveDataHeadingText(),
//                         buildList(docsListName),
//                       ]),
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   queueStatistics(docsListName) {
//     var dimVar = MediaQuery.of(context).size;

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SizedBox(
//           // height: dimVar.height * 0.13,
//           width: dimVar.width,
//           child: Card(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     analyticText(docsListName.length == 0
//                         ? 'Current person : Queue is empty'
//                         : 'Current person : ${docsListName[0]['userAcc_name']}'),
//                     analyticText(docsListName.length < 2
//                         ? 'Next : Emtpy'
//                         : 'Next : ${docsListName[1]['userAcc_name']}'),
//                     analyticText(docsListName.length < 3
//                         ? 'Next to next : Emtpy'
//                         : 'Next to next : ${docsListName[2]['userAcc_name']}'),
//                     Divider(),
//                     analyticText(
//                         'Total people in queue : ${docsListName.length}'),
//                     analyticText(
//                       storeYourTurn == -1
//                           ? 'You are not in queue yet'
//                           : 'Your number in queue is  : ${storeYourTurn + 1}',
//                     ),
//                     analyticText('Average time per person : N/A'),
//                     analyticText('Estimated time for your turn : N/A'),
//                     // notifyUpcomingTurnEmail_STATES()
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }

//   // calculateAvgUserTime(List fiveTimeItemList){
//   //   fiveTimeItemList
//   // }

//   analyticText(textArg) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
//       child: Text(
//         textArg,
//         // maxLines: 2,
//         // overflow: TextOverflow.ellipsis,
//         // textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           // decoration: TextDecoration.none,
//           // fontStyle: FontStyle.italic,
//           // fontFamily: "FontNameHere" ,
//           fontWeight: FontWeight.bold,
//           // fontWeight: FontWeight.w300,
//           // fontSize: 20.0,
//         ),
//       ),
//     );
//   }

//   LiveDataHeadingText() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(23, 23, 23, 5),
//       child: Text(
//         "Live Queue:",
//         // maxLines: 2,
//         // overflow: TextOverflow.ellipsis,
//         // textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.black,
//           // decoration: TextDecoration.none,
//           // fontStyle: FontStyle.italic,
//           // fontFamily: "FontNameHere" ,
//           fontWeight: FontWeight.bold,
//           // fontWeight: FontWeight.w300,
//           fontSize: 20.0,
//         ),
//       ),
//     );
//   }

//   buildList(docsListName) {
//     var dimVar = MediaQuery.of(context).size;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//           height: dimVar.height * 0.20,
//           // width: dimVar.width * 0.3,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             itemCount: docsListName.length,
//             itemBuilder: (context, i) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //# show 'current' / 'next' order text
//                   ternaryServing(i),

//                   //# queueUser card design
//                   Padding(
//                     padding: const EdgeInsets.all(2.0),
//                     child: Card(
//                       color: storeId_user == docsListName[i]['userAcc_fk']
//                           ? Colors.tealAccent
//                           : null,
//                       elevation: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           // height: dimVar.height * 0.1,
//                           width: dimVar.width * 0.6,

//                           //@ start design from here

//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               // Padding(
//                               //   padding: const EdgeInsets.fromLTRB(10.0, 1, 0.0, 1),
//                               //   child:
//                               // CircleAvatar(
//                               //   radius: 30,
//                               //   backgroundColor: Colors.white,
//                               //   child:

//                               Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${i + 1}',
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 35),
//                                   ),
//                                   Icon(
//                                     Icons.person,
//                                     size: 40,
//                                     color: Colors.black,
//                                   ),
//                                   Spacer(),
//                                   //@ imp ( send email)
//                                   showDeleteButtonOnAdminOnly(
//                                     selectedUserId: docsListName[i]['id'],
//                                     nextFifthEmail: i + 5 < docsListName.length
//                                         ? docsListName[i + 5]['userAcc_name']
//                                         : false,
//                                   ),
//                                 ],
//                               ),

//                               // ),
//                               // ),
//                               Padding(
//                                 // padding: const EdgeInsets.all(8.0),
//                                 padding:
//                                     const EdgeInsets.fromLTRB(8.0, 2, 8.0, 2),

//                                 child: Text(
//                                   "${docsListName[i]['userAcc_name']}",
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   // textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     // decoration: TextDecoration.none,
//                                     // fontStyle: FontStyle.italic,
//                                     // fontFamily: "FontNameHere" ,
//                                     fontWeight: FontWeight.bold,
//                                     // fontWeight: FontWeight.w300,
//                                     fontSize: 12.0,
//                                   ),
//                                 ),
//                               ),

//                               Padding(
//                                 // padding: const EdgeInsets.all(8.0),
//                                 padding:
//                                     const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                                 child: Text(
//                                   "queueUser id : ${docsListName[i]['id']}",
//                                   // maxLines: 2,
//                                   // overflow: TextOverflow.ellipsis,
//                                   // textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.blueGrey[600],
//                                     // decoration: TextDecoration.none,
//                                     // fontStyle: FontStyle.italic,
//                                     // fontFamily: "FontNameHere" ,
//                                     // fontWeight: FontWeight.bold,
//                                     // fontWeight: FontWeight.w300,
//                                     fontSize: 10.0,
//                                   ),
//                                 ),
//                               ),

//                               Padding(
//                                 // padding: const EdgeInsets.all(8.0),
//                                 padding:
//                                     const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                                 child: Text(
//                                   "Record Time : ${docsListName[i]['joinedTime']}",
//                                   // maxLines: 2,
//                                   // overflow: TextOverflow.ellipsis,
//                                   // textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.blueGrey[600],
//                                     // decoration: TextDecoration.none,
//                                     // fontStyle: FontStyle.italic,
//                                     // fontFamily: "FontNameHere" ,
//                                     // fontWeight: FontWeight.bold,
//                                     // fontWeight: FontWeight.w300,
//                                     fontSize: 10.0,
//                                   ),
//                                 ),
//                               ),

//                               //! show if your turn
//                               Padding(
//                                 // padding: const EdgeInsets.all(8.0),
//                                 padding:
//                                     const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                                 child: Container(
//                                   color: Colors.white,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: Text(
//                                       storeId_user ==
//                                               docsListName[i]['userAcc_fk']
//                                           ? 'NOTE : This is your turn'
//                                           : '',
//                                       // maxLines: 2,
//                                       // overflow: TextOverflow.ellipsis,
//                                       // textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.blueGrey[600],
//                                         // decoration: TextDecoration.underline,
//                                         fontStyle: FontStyle.italic,
//                                         // fontFamily: "FontNameHere" ,
//                                         fontWeight: FontWeight.bold,
//                                         // fontWeight: FontWeight.w300,
//                                         fontSize: 10.0,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // ),
//                 ],
//               );
//             },
//           )),
//     );
//   }

//   showDeleteButtonOnAdminOnly({
//     required selectedUserId,
//     required nextFifthEmail,
//   }) {
//     if (widget.fromDiffProfile == null && widget.currentQueueUserObj == null) {
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(30.0, 1, 8.0, 1),
//         child: CircleAvatar(
//           radius: 15,
//           backgroundColor: Colors.black,
//           child: Center(
//             child: IconButton(
//               icon: Icon(
//                 Icons.delete,
//                 size: 15,
//                 color: Colors.white,
//               ),
//               onPressed: () =>
//                   deleteQueueUserFunc(selectedUserId, nextFifthEmail),
//             ),
//           ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget ternaryServing(i) {
//     if (i == 0) {
//       return Text(
//         '   Current person : ',
//         style: TextStyle(color: Colors.grey, fontSize: 12),
//       );
//     } else if (i == 1) {
//       return Text(
//         '   Next person: ',
//         style: TextStyle(color: Colors.grey, fontSize: 12),
//       );
//     }
//     return Text('');
//   }

// /* -------------------------------------------------------------------------- */
// /*                         //@ Newly added from sample                        */
// /* -------------------------------------------------------------------------- */

//   statistics_section2(docsListName) {
//     return Card(
//       // color: Colors.red,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(23.0, 23, 23, 15),
//                     child: Text(
//                       "Your turn in queue:",
//                       // maxLines: 2,
//                       // overflow: TextOverflow.ellipsis,
//                       // textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         // decoration: TextDecoration.none,
//                         // fontStyle: FontStyle.italic,
//                         // fontFamily: "FontNameHere" ,
//                         fontWeight: FontWeight.bold,
//                         // fontWeight: FontWeight.w300,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 1),
//                   //   child: Text(
//                   //     storeYourTurn == -1
//                   //         ? 'You are not in queue yet'
//                   //         : 'your number in queue is : ${storeYourTurn + 1}',
//                   //     // maxLines: 2,
//                   //     // overflow: TextOverflow.ellipsis,
//                   //     // textAlign: TextAlign.center,
//                   //     style: TextStyle(
//                   //       color: Colors.black,
//                   //       // decoration: TextDecoration.none,
//                   //       // fontStyle: FontStyle.italic,
//                   //       // fontFamily: "FontNameHere" ,
//                   //       // fontWeight: FontWeight.bold,
//                   //       // fontWeight: FontWeight.w300,
//                   //       fontSize: 13.0,
//                   //     ),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
//                     child: Text(
//                       'total people in queue : ${docsListName.length}',
//                       // maxLines: 2,
//                       // overflow: TextOverflow.ellipsis,
//                       // textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         // decoration: TextDecoration.none,
//                         // fontStyle: FontStyle.italic,
//                         // fontFamily: "FontNameHere" ,
//                         // fontWeight: FontWeight.bold,
//                         // fontWeight: FontWeight.w300,
//                         // fontSize: 20.0,
//                         fontSize: 13.0,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
//                     child: Text(
//                       'average time per person : N/A',
//                       // maxLines: 2,
//                       // overflow: TextOverflow.ellipsis,
//                       // textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         // decoration: TextDecoration.none,
//                         // fontStyle: FontStyle.italic,
//                         // fontFamily: "FontNameHere" ,
//                         // fontWeight: FontWeight.bold,
//                         // fontWeight: FontWeight.w300,
//                         // fontSize: 20.0,
//                         fontSize: 13.0,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
//                     child: Text(
//                       'estimated time for your turn : N/A',
//                       // maxLines: 2,
//                       // overflow: TextOverflow.ellipsis,
//                       // textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         // decoration: TextDecoration.none,
//                         // fontStyle: FontStyle.italic,
//                         // fontFamily: "FontNameHere" ,
//                         // fontWeight: FontWeight.bold,
//                         // fontWeight: FontWeight.w300,
//                         // fontSize: 20.0,
//                         fontSize: 13.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8.0, 1, 35.0, 1),
//                 child: CircleAvatar(
//                   radius: 38,
//                   backgroundColor: Colors.greenAccent,
//                   child: Padding(
//                     padding: const EdgeInsets.all(3.0),
//                     child: CircleAvatar(
//                       radius: 37,
//                       backgroundColor: Colors.white,
//                       child: FittedBox(
//                         child: Padding(
//                           padding: const EdgeInsets.all(17.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 'Your turn:',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               Text(
//                                 storeYourTurn == -1
//                                     ? '0'
//                                     : '${storeYourTurn + 1}',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(
//               //   width: 50,
//               // )
//             ],
//           ),
//           Padding(
//             // padding: const EdgeInsets.all(15.0),
//             padding: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 30),
//             child: Tooltip(
//               message: storeYourTurn == -1
//                   ? 'You are not in queue yet'
//                   : 'Your number in queue is : ${storeYourTurn + 1}',
//               triggerMode: TooltipTriggerMode.tap,
//               child: new LinearPercentIndicator(
//                 // leading: Text(
//                 //   'Start',
//                 //   textAlign: TextAlign.end,
//                 // ),
//                 // trailing: Text(
//                 //   'End',
//                 //   textAlign: TextAlign.start,
//                 // ),
//                 center: Text(
//                   storeYourTurn == -1
//                       ? 'You are not in queue yet'
//                       : '${storeYourTurn + 1}/${docsListName.length}\n  (Your turn/total people)',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 barRadius: Radius.circular(2),
//                 // width: dimVar.width,
//                 lineHeight: 45.0,
//                 percent: (storeYourTurn + 1) / (docsListName.length),
//                 backgroundColor: Colors.greenAccent[100],
//                 progressColor: Colors.greenAccent,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   firstThreePerson(docsListName) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(23.0),
//             child: Text(
//               "Upcoming people in queue:",
//               // maxLines: 2,
//               // overflow: TextOverflow.ellipsis,
//               // textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 // decoration: TextDecoration.none,
//                 // fontStyle: FontStyle.italic,
//                 // fontFamily: "FontNameHere" ,
//                 fontWeight: FontWeight.bold,
//                 // fontWeight: FontWeight.w300,
//                 fontSize: 20.0,
//               ),
//             ),
//           ),
//           Flex(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             direction: Axis.horizontal,
//             children: [
//               //@ 2 person
//               firstThreePersonSingleDesign(
//                   2,
//                   'Next :',
//                   docsListName.length < 2
//                       ? 'Emtpy'
//                       : '${docsListName[1]['userAcc_name']}'),

//               //@ 1 person
//               firstThreePersonSingleDesign(
//                   1,
//                   'Current :',
//                   docsListName.length == 0
//                       ? 'Queue is Empty'
//                       : '${docsListName[0]['userAcc_name']}',
//                   isCenter: true),

//               //@ 3 person

//               firstThreePersonSingleDesign(
//                   3,
//                   'Next to next :',
//                   docsListName.length < 3
//                       ? 'Emtpy'
//                       : '${docsListName[2]['userAcc_name']}')
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   firstThreePersonSingleDesign(int number, String tagText, String email,
//       {isCenter = false}) {
//     return Flexible(
//       fit: FlexFit.tight,
//       flex: 1,
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: isCenter ? 40 : 30,
//             backgroundColor: Colors.black,
//             child: FittedBox(
//               alignment: Alignment.center,
//               child: Row(
//                 children: [
//                   Text(
//                     number.toString(),
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   Icon(
//                     Icons.person,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0.0, 8, 0.0, 0),
//             child: Text(
//               tagText,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 // decoration: TextDecoration.none,
//                 // fontStyle: FontStyle.italic,
//                 // fontFamily: "FontNameHere" ,
//                 fontWeight: FontWeight.bold,
//                 // fontWeight: FontWeight.w300,
//                 fontSize: 10.0,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 8),
//             child: Text(
//               email,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 // decoration: TextDecoration.none,
//                 // fontStyle: FontStyle.italic,
//                 // fontFamily: "FontNameHere" ,
//                 // fontWeight: FontWeight.bold,
//                 // fontWeight: FontWeight.w300,
//                 fontSize: 11.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                              //@ Body widgets                              */
// /* -------------------------------------------------------------------------- */

//   myFab() {
//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       backgroundColor: Colors.teal[900],
//       // tooltip: "Hint text on hover ",
//       onPressed: () async {
//         await Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return QueueUser_cud_screen(
//               propOfQueue: widget.admin_QueueObj,
//               fromDiffProfile: widget.fromDiffProfile);
//         }));
//       },
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       // elevation: 0.0,
//       leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           }),
//       // automaticallyImplyLeading: true,  //removes default back arrow on appbar

//       title: Text(
//         'Watch Live Queue', //give here appBar title
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//       //actions: [

//       //  Padding(
//       //    padding: const EdgeInsets.all(8.0),
//       //   child: IconButton(
//       //       onPressed: null,
//       //       icon: Icon(
//       //         Icons.search,
//       //         color: Colors.black,
//       //       )), )
//       // ],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                //@ My states                               */
// /* -------------------------------------------------------------------------- */

//   // notifyUpcomingTurnEmail_STATES() {
//   //   return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
//   //     listener: (context, state) {
//   //       if (state is QueueUser_NotifyEmail_SentSuccessfully_state) {
//   //         //Make sure this is a part of scaffold
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           SnackBar(
//   //             backgroundColor: Colors.green,
//   //             behavior: SnackBarBehavior.floating,
//   //             content: Text("Email sent succesfully"),
//   //           ),
//   //         );
//   //       }
//   //     },
//   //     builder: (context, state) {
//   //       return Padding(
//   //         padding: const EdgeInsets.all(8.0),
//   //         child: Text('NOTE: Email sent to next fifth person'),
//   //       );
//   //     },
//   //   );
//   // }

// /* -------------------------------------------------------------------------- */
// /*                              //@ FUNCTONALITIE                             */
// /* -------------------------------------------------------------------------- */

//   deleteQueueUserFunc(QueueUserid, nextFifthEmail) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             contentPadding: const EdgeInsets.all(14.0),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Warning!",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                       "Are you sure you want to remove this user from Queue? This can't be undone, once deleted."),
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 child: Text(
//                   "Delete permanently",
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onPressed: () {
//                   BlocProvider.of<QueueUserCudBloc>(context)
//                       .add(QueueUser_Delete_onButtonPressed_Event(QueueUserid));
//                   Navigator.pop(context);

//                   // send email to next fifth person
//                   nextFifthEmail is String
//                       ? BlocProvider.of<QueueUserCudBloc>(context).add(
//                           QueueUser_Notify_Next5th_queueUserByEmail_Event(
//                               nextFifthEmail))
//                       : null;
//                 },
//               )
//             ],
//           );
//         });
//   }
// }
