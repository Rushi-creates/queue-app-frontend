// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
// import '../../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';

// class QueueUser_Fetch_Screen extends StatefulWidget {
//   final propOfQueue;
//   final fromDiffProfile;
//   const QueueUser_Fetch_Screen(
//       {Key? key, this.propOfQueue, required this.fromDiffProfile})
//       : super(key: key);
//   const QueueUser_Fetch_Screen.propOfQueue(
//       {required this.propOfQueue, required this.fromDiffProfile});
//   @override
//   _QueueUser_Fetch_ScreenState createState() => _QueueUser_Fetch_ScreenState();
// }

// /* -------------------------------------------------------------------------- */
// /*                               //! State class                              */
// /* -------------------------------------------------------------------------- */

// class _QueueUser_Fetch_ScreenState extends State<QueueUser_Fetch_Screen> {
//   final ScrollController scrollController = ScrollController();

// /* -------------------------------------------------------------------------- */
// /*                            //! lifecycle methods                           */
// /* -------------------------------------------------------------------------- */

//   @override
//   void initState() {
//     super.initState();

//     //# a scroll listner which listens always
//     scrollController.addListener(scrollListener);

//     //# to call first set of pages
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     print('scroll controller disposed');
//     super.dispose();
//   }

//   void scrollListener() {
//     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//       print('list endedddd');
//       Future.delayed(Duration(milliseconds: 100), () {
//         BlocProvider.of<QueueUserFetchBloc>(context)
//             .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
//       });
//     }
//   }

// /* -------------------------------------------------------------------------- */
// /*                              //! Build method                              */
// /* -------------------------------------------------------------------------- */

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       appBar: myHeader(),
//       body: myBody(),
//       floatingActionButton:
//           widget.fromDiffProfile == null ? Container() : myFab(),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //! body structure                             */
// /* -------------------------------------------------------------------------- */

//   myBody() {
//     return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
//       listener: (context, state) {
//         if (state is QueueUser_create_Loaded_State ||
//             state is QueueUser_update_Loaded_State ||
//             state is QueueUser_Delete_Loaded_state) {
//           onRefreshFunc();
//         }
//       },
//       builder: (context, state) {
//         return RefreshIndicator(
//           onRefresh: () async {
//             print('Refreshed');
//             onRefreshFunc();
//           },
//           child: SingleChildScrollView(
//             //! note : make sure to pass controller in this list
//             controller: scrollController,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [fetchListStates(), belowLastTileStates()]),
//           ),
//         );
//       },
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                           //! fetch list states                            */
// /* -------------------------------------------------------------------------- */

//   fetchListStates() {
//     List emptyList = [];

//     return BlocConsumer<QueueUserFetchBloc, QueueUserFetchState>(
//       listener: (context, state) {
//         if (state is QueueUser_Fetch_Loaded_State) {
//           emptyList = state.modelObjList;
//         }
//       },
//       builder: (context, state) {
//         if (state is QueueUser_Fetch_Loaded_State ||
//             state is QueueUser_Fetch_More_Loaded_ButEmpty_State ||
//             state is QueueUser_Fetch_Loading_State ||
//             state is QueueUser_Fetch_Error_State) {
//           return buildFetchList(emptyList);
//         }
//         return buildFetchList(emptyList);
//       },
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                 //! if loaded then build fetchList                         */
// /* -------------------------------------------------------------------------- */

//   buildFetchList(List listArg) {
//     return listArg.isEmpty
//         ? showFetchListEmptyMsg()
//         : ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemCount: listArg.length,
//             itemBuilder: (context, i) {
//               return listArg.isEmpty
//                   ? showFetchListEmptyMsg()
//                   : Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
//                       child: ListTile(
//                         tileColor: Colors.teal,
//                         leading: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: Text(listArg[i].id.toString()),
//                         ),
//                         title: Padding(
//                           padding: const EdgeInsets.fromLTRB(8.0, 8, 8.0, 1),
//                           child: Text(
//                             'Owned by : ${listArg[i].acc_uid}-${listArg[i].acc_name}',
//                             maxLines: 1,
//                           ),
//                         ),
//                         subtitle: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Queue name : ${listArg[i].q_uid}-${listArg[i].q_name}',
//                                 maxLines: 1,
//                               ),
//                               Text(
//                                 'Record time : ${listArg[i].recordTime}',
//                                 maxLines: 1,
//                               ),
//                             ],
//                           ),
//                         ),
//                         onTap: () async {
//                           //
//                           //                   await Navigator.pushNamed(
//                           //                       context, AppRouter.RN_QueueUser_cud_screen_$named,
//                           //                       arguments: {
//                           //                         'singleObj': listArg[i],
//                           //                         'propOfQueue': widget.propOfQueue,
//                           //                         'fromDiffProfile': widget.fromDiffProfile,
//                           //                       });

//                           //                   // myStoreList.clear(); //! clear before nav
//                           //                   setState(() {
//                           //                     print('from list on tap');
//                           //                   });
//                         },
//                       ),
//                     );
//             },
//           );
//   }

// /* -------------------------------------------------------------------------- */
// /*               //! display error,loading states widgets                     */
// /* -------------------------------------------------------------------------- */

//   belowLastTileStates() {
//     return BlocConsumer<QueueUserFetchBloc, QueueUserFetchState>(
//       listener: (context, state) {
//         if (state is QueueUser_Fetch_More_Loaded_ButEmpty_State) {
//           //! stop scrollListener , once no more items to fetch  ( do not dispose)
//           scrollController.removeListener(scrollListener);
//         } else if (state is QueueUser_Fetch_Error_State) {
//           // this is imp
//           // scrollController.addListener(scrollListener);

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.red,
//               content: Text('Some Network error'),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is QueueUser_Fetch_Loading_State) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 buildLoading(),
//                 SizedBox(
//                   height: 20,
//                 )
//               ],
//             ),
//           );
//         } else if (state is QueueUser_Fetch_Error_State) {
//           return connectionErrorText(state.error);
//         } else if (state is QueueUser_Fetch_More_Loaded_ButEmpty_State) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Nothing more to load'),
//           );
//         }
//         return Text('');

//         //# if you ever want to use button instead of scroll controller
//         // return TextButton(
//         //   child: Text(
//         //     "Load more ",
//         //     style: TextStyle(color: Colors.white),
//         //   ),
//         //   style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//         //   onPressed: () {
//         //     BlocProvider.of<QueueUserFetchBloc>(context)
//         //         .add(Fetch_Start_Event());
//         //   },
//         // );
//       },
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                         //# Sttic Helper functions                         */
// /* -------------------------------------------------------------------------- */

//   onRefreshFunc() {
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onRefresh_Event());
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
//     scrollController.addListener(scrollListener);
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //# Static widgets                             */
// /* -------------------------------------------------------------------------- */

//   connectionErrorText(error) {
//     return Center(
//       child: Row(
//         children: [
//           Text(
//             'Connection error or \n Error: $error',
//             style: TextStyle(color: Colors.red),
//           ),
//           TextButton(
//             child: Text(
//               "Try again",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//             onPressed: () {
//               BlocProvider.of<QueueUserFetchBloc>(context)
//                   .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   showFetchListEmptyMsg() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Text(
//           'No Data',
//           // maxLines: 2,
//           // overflow: TextOverflow.ellipsis,
//           // textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.grey,
//             // decoration: TextDecoration.none,
//             // fontStyle: FontStyle.italic,
//             // fontFamily: "FontNameHere" ,
//             fontWeight: FontWeight.bold,
//             // fontWeight: FontWeight.w300,
//             fontSize: 20.0,
//           ),
//         ),
//       ),
//     );
//   }

//   buildLoading() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   myFab() {
//     return FloatingActionButton(
//       child: Icon(Icons.add),
//       backgroundColor: Colors.teal[900],
//       // tooltip: "Hint text on hover ",
//       onPressed: () async {
//         // await Navigator.pushNamed(context, AppRouter.RN_QueueUser_cud_screen,
//         //     arguments: {
//         //       'propOfQueue': widget.propOfQueue,
//         //       'fromDiffProfile': widget.fromDiffProfile
//         //     });
//       },
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: Text(
//         'Current queue', //give here appBar title
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//       // actions: [
//       //   Padding(
//       //     padding: const EdgeInsets.all(8.0),
//       //     child: IconButton(
//       //         onPressed: () {
//       //           BlocProvider.of<QueueUserFetchPropBloc>(context)
//       //               .add(QueueUser_FetchProp_More_onListEnd_Event());
//       //         },
//       //         icon: Icon(
//       //           Icons.refresh,
//       //           color: Colors.black,
//       //         )),
//       //   )
//       // ],
//     );
//   }
// }
