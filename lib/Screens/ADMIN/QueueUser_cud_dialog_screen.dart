// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
// import '../../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
// import '../../../Repository_layer/UserAcc_repo.dart';
// import '../../../service_layer/models/QueueUser.dart';
// import '../../../service_layer/models/UserAcc.dart';
// import '../../COMPONENTS/myComponents.dart';

// class QueueUser_cud_dialog_screen extends StatelessWidget {
//   final fromDiffProf;
//   final singleObj;
//   const QueueUser_cud_dialog_screen({
//     super.key,
//     required this.fromDiffProf,
//     required this.singleObj,
//   });

//   /* -------------------------------------------------------------------------- */
// /*                            //@  States                                     */
// /* -------------------------------------------------------------------------- */
//   //! Build
//   @override
//   Widget build(BuildContext context) {
//     print('build called');
//     return my_dialog_cud_states();
//   }

//   my_dialog_cud_states() {
//     return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
//       listener: (context, state) {
//         //# error states
//         if (state is QueueUser_update_Error_State) {
//           showErrorSnackbar(context, state.error);
//           Navigator.pop(context);
//         } else if (state is QueueUser_create_Error_State) {
//           showErrorSnackbar(context, state.error);
//           Navigator.pop(context);
//         } else if (state is QueueUser_Delete_Error_State) {
//           showErrorSnackbar(context, state.error);
//           Navigator.pop(context);
//         }
//         //# loaded state
//         else if (state is QueueUser_create_Loaded_State ||
//             state is QueueUser_update_Loaded_State ||
//             state is QueueUser_Delete_Loaded_state) {
//           showSuccessSnackbar(context);
//           //! reload on back ( sent true)
//           Navigator.pop(context, true);
//         } else if (state is QueueUser_Cant_create_already_exists_State) {
//           print('already exists');
//           showCantCreateSnackbar(context, state.msg);
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         if (state is QueueUser_create_Loading_State ||
//             state is QueueUser_update_Loading_State ||
//             state is QueueUser_Delete_Loading_state) {
//           return MyComponents.buildLoading();
//         }
//         //pass here first widget
//         return joinQueue_dialogBox(context);
//       },
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //@ widgets                                */
// /* -------------------------------------------------------------------------- */

  // joinQueue_dialogBox(context) {
  //   return showDialog(
  //       barrierDismissible: false,
  //       barrierColor: Color.fromARGB(199, 0, 0, 0),
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           contentPadding: const EdgeInsets.all(14.0),
  //           content: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 8, 8.0, 1),
  //                 child: Text(
  //                   "Stand in queue",
  //                   style: TextStyle(
  //                     color: Colors.teal[900],
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20.0,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 8),
  //                 child: Text(
  //                   "Do you wish to join this queue?",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 13.0,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           actions: [
  //             TextButton(
  //                 child: Text(
  //                   'Cancel',
  //                   style: TextStyle(color: Colors.teal),
  //                 ),
  //                 onPressed: () async {
  //                   Navigator.pop(context);
  //                 }),
  //             TextButton(
  //               child: Text(
  //                 "Join Queue",
  //                 style: TextStyle(color: Colors.teal),
  //               ),
  //               onPressed: () async {
  //                 UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
  //                 UserAcc myUser = await userAcc_sp_repo.spGet_UserAccObj();

  //                 QueueUser queueUserObj = QueueUser(
  //                     queue_name: singleObj.name,
  //                     userAcc_name: myUser.email,
  //                     adminAcc_name: fromDiffProf.email,
  //                     joinedTime:
  //                         '${DateFormat('hh:mm:ss a, EEE, d/M/y').format(DateTime.now())}',
  //                     queue_fk: singleObj.id,
  //                     userAcc_fk: myUser.id!,
  //                     adminAcc_fk: fromDiffProf.id);

  //                 //
  //                 BlocProvider.of<QueueUserCudBloc>(context).add(
  //                     QueueUser_create_onButtonPressed_Event(queueUserObj));
  //                 print(queueUserObj);

  //                 //# refresh
  //                 BlocProvider.of<QueueUserFetchBloc>(context)
  //                     .add(QueueUser_Fetch_onInit_Event(singleObj.id));
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

// /* -------------------------------------------------------------------------- */
// /*                             //@ Static widgets                             */
// /* -------------------------------------------------------------------------- */

//   showCantCreateSnackbar(context, msg) {
//     //Make sure this is a part of scaffold
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         behavior: SnackBarBehavior.floating,
//         backgroundColor: Colors.amber,
//         content: Text(
//             'You are already standing in the queue, cant add again.\n$msg'),
//       ),
//     );
//   }

//   showErrorSnackbar(context, error) {
//     //Make sure this is a part of scaffold
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.red,
//         content: Text("Some error!, couldn't complete action \n Error: $error"),
//       ),
//     );
//   }

//   showSuccessSnackbar(context) {
//     //Make sure this is a part of scaffold
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.green,
//         content: Text("Action completed"),
//       ),
//     );
//   }
// }
