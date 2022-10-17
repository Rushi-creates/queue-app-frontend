// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';

// class QueueUser_fetch_listTile_widget extends StatelessWidget {
//   final listArg;
//   final i;
//   final store_userId;

//   const QueueUser_fetch_listTile_widget(
//       {super.key,
//       required this.listArg,
//       required this.i,
//       required this.store_userId});

//   @override
//   Widget build(BuildContext context) {
//     return oneTile(context);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                   //@ new                                  */
// /* -------------------------------------------------------------------------- */

//   oneTile(context) {
//     var dimVar = MediaQuery.of(context).size;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ternaryServing(i), // show 'current' / 'next' order text

//         //# queueUser card design
//         Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Card(
//             color: store_userId == listArg[i].userAcc_fk
//                 ? Colors.tealAccent
//                 : null,
//             elevation: 1,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 // height: dimVar.height * 0.1,
//                 width: dimVar.width * 0.6,

//                 //@ start design from here

//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     // Padding(
//                     //   padding: const EdgeInsets.fromLTRB(10.0, 1, 0.0, 1),
//                     //   child:
//                     // CircleAvatar(
//                     //   radius: 30,
//                     //   backgroundColor: Colors.white,
//                     //   child:

//                     Row(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${i + 1}',
//                           style: TextStyle(color: Colors.black, fontSize: 35),
//                         ),
//                         Icon(
//                           Icons.person,
//                           size: 40,
//                           color: Colors.black,
//                         ),
//                         Spacer(),
//                         //@ imp ( send email)
//                         // fromDiffProfile == null && widget.currentQueueUserObj == null ?
//                         showDeleteButtonOnAdminOnly(
//                           context: context,
//                           selectedUserId: listArg[i].id,
//                           nextFifthEmail: i + 5 < listArg.length
//                               ? listArg[i + 5].userAcc_name
//                               : false,
//                         )
//                         // : Container()
//                       ],
//                     ),

//                     // ),
//                     // ),
//                     Padding(
//                       // padding: const EdgeInsets.all(8.0),
//                       padding: const EdgeInsets.fromLTRB(8.0, 2, 8.0, 2),

//                       child: Text(
//                         "${listArg[i].userAcc_name}",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         // textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           // decoration: TextDecoration.none,
//                           // fontStyle: FontStyle.italic,
//                           // fontFamily: "FontNameHere" ,
//                           fontWeight: FontWeight.bold,
//                           // fontWeight: FontWeight.w300,
//                           fontSize: 12.0,
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       // padding: const EdgeInsets.all(8.0),
//                       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                       child: Text(
//                         "queueUser id : ${listArg[i].id}",
//                         // maxLines: 2,
//                         // overflow: TextOverflow.ellipsis,
//                         // textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.blueGrey[600],
//                           // decoration: TextDecoration.none,
//                           // fontStyle: FontStyle.italic,
//                           // fontFamily: "FontNameHere" ,
//                           // fontWeight: FontWeight.bold,
//                           // fontWeight: FontWeight.w300,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       // padding: const EdgeInsets.all(8.0),
//                       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                       child: Text(
//                         "Record Time : ${listArg[i].joinedTime}",
//                         // maxLines: 2,
//                         // overflow: TextOverflow.ellipsis,
//                         // textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.blueGrey[600],
//                           // decoration: TextDecoration.none,
//                           // fontStyle: FontStyle.italic,
//                           // fontFamily: "FontNameHere" ,
//                           // fontWeight: FontWeight.bold,
//                           // fontWeight: FontWeight.w300,
//                           fontSize: 10.0,
//                         ),
//                       ),
//                     ),

//                     //! show if your turn
//                     Padding(
//                       // padding: const EdgeInsets.all(8.0),
//                       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 1),
//                       child: Container(
//                         color: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Text(
//                             store_userId == listArg[i].userAcc_fk
//                                 ? 'NOTE : This is your turn'
//                                 : '',
//                             // maxLines: 2,
//                             // overflow: TextOverflow.ellipsis,
//                             // textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.blueGrey[600],
//                               // decoration: TextDecoration.underline,
//                               fontStyle: FontStyle.italic,
//                               // fontFamily: "FontNameHere" ,
//                               fontWeight: FontWeight.bold,
//                               // fontWeight: FontWeight.w300,
//                               fontSize: 10.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // ),
//       ],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //@ Static widgets                             */
// /* -------------------------------------------------------------------------- */

//   showDeleteButtonOnAdminOnly({
//     required context,
//     required selectedUserId,
//     required nextFifthEmail,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(30.0, 1, 8.0, 1),
//       child: CircleAvatar(
//         radius: 15,
//         backgroundColor: Colors.black,
//         child: Center(
//           child: IconButton(
//             icon: Icon(
//               Icons.delete,
//               size: 15,
//               color: Colors.white,
//             ),
//             onPressed: () =>
//                 deleteQueueUserFunc(context, selectedUserId, nextFifthEmail),
//           ),
//         ),
//       ),
//     );
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
// /*                             //@ Functionalities                            */
// /* -------------------------------------------------------------------------- */

//   fetchListFunc(context, listTileInfo) async {
//     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//     //   return AdminVerifyScreen();
//     // }));
//   }

//   deleteQueueUserFunc(context, QueueUserid, nextFifthEmail) {
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

// /* -------------------------------------------------------------------------- */
// /*                                   //@ old                                  */
// /* -------------------------------------------------------------------------- */

// //  listTile(context) {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
// //       child: ListTile(
// //         tileColor: Colors.teal,
// //         leading: tile_leading(),
// //         title: tile_title(),
// //         subtitle: tile_subtitle(),
// //         onTap: () async => await fetchListFunc(singleObj, context),
// //       ),
// //     );
// //   }

// //   tile_leading() {
// //     return CircleAvatar(
// //       backgroundColor: Colors.white,
// //       child: Text(singleObj.id.toString()),
// //     );
// //   }

// //   tile_title() {
// //     return Text(
// //       singleObj.userAcc_name,
// //       maxLines: 1,
// //     );
// //   }

// //   tile_subtitle() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           singleObj.joinedTime,
// //           maxLines: 1,
// //         ),
// //         SizedBox(
// //           height: 80,
// //         )
// //       ],
// //     );
// //   }

// }
