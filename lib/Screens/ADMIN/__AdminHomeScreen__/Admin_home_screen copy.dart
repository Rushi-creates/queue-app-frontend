// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:no_queue2/Screens/ADMIN/Queues_cud_screen.dart';

// import '../../../../../Logic/ADMIN/__QueuesCud__/Queues_cud_logic/Queues_cud_bloc.dart';
// import '../../../../../Logic/ADMIN/__QueuesFetch__/Queues_fetch_logic/Queues_fetch_bloc.dart';
// import 'Queues_fetch_screen/Queues_fetch_belowList_widget.dart';
// import 'Queues_fetch_screen/Queues_fetch_list_widget.dart';
// import 'Shop_info_card.dart';

// class Admin_home_screen extends StatefulWidget {
//   final fromDiffProfile;
//   const Admin_home_screen({Key? key, this.fromDiffProfile}) : super(key: key);
//   const Admin_home_screen.fromDiffProfile({required this.fromDiffProfile});

//   @override
//   _Admin_home_screenState createState() => _Admin_home_screenState();
// }

// /* -------------------------------------------------------------------------- */
// /*                               //! State class                              */
// /* -------------------------------------------------------------------------- */

// class _Admin_home_screenState extends State<Admin_home_screen> {
//   final ScrollController scrollController = ScrollController();

// /* -------------------------------------------------------------------------- */
// /*                            //! lifecycle methods                           */
// /* -------------------------------------------------------------------------- */

//   @override
//   void initState() {
//     super.initState();

//     //# refresh previous bloc (imp)
//     widget.fromDiffProfile == null
//         ? null

//         // if from diff profile
//         : BlocProvider.of<QueuesFetchBloc>(context)
//             .add(Queues_Fetch_onRefresh_Event());

//     //# a scroll listner which listens always
//     scrollController.addListener(scrollListener);

//     //# to call first set of pages
//     widget.fromDiffProfile == null
//         ? BlocProvider.of<QueuesFetchBloc>(context)
//             .add(Queues_Fetch_onInit_Event())

//         // if from diff profile
//         : BlocProvider.of<QueuesFetchBloc>(context).add(
//             Queues_Fetch_onInit_fromDiffProfile_Event(
//                 widget.fromDiffProfile.id));
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     print('scroll controller disposed');
//     super.dispose();
//   }

// /* -------------------------------------------------------------------------- */
// /*                              //! Build method                              */
// /* -------------------------------------------------------------------------- */

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       // appBar: myHeader(),
//       body: myBody_STATES(),
//       floatingActionButton:
//           widget.fromDiffProfile == null ? myFab() : Container(),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //! body structure                             */
// /* -------------------------------------------------------------------------- */

//   myBody_STATES() {
//     // var dimVar = MediaQuery.of(context).size;

//     return BlocConsumer<QueuesCudBloc, QueuesCudState>(
//         listener: (context, state) {
//       if (state is Queues_create_Loaded_State ||
//           state is Queues_update_Loaded_State ||
//           state is Queues_Delete_Loaded_state) {
//         onRefreshFunc();
//       }
//     }, builder: (context, state) {
//       return RefreshIndicator(
//           onRefresh: () async {
//             print('Refreshed');
//             onRefreshFunc();
//           },
//           child: myBody());
//     });
//   }

//   myBody() {
//     return SingleChildScrollView(
//       //! note : make sure to pass controller in this list
//       controller: scrollController,
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Align(
//               child: ShopInfo_card(
//                 fromDiffProfile: widget.fromDiffProfile,
//               ),
//               alignment: Alignment.topLeft,
//             ),
//             Divider(),
//             Align(
//               child: selectQueueHeadingText(),
//               alignment: Alignment.topLeft,
//             ),
//             Queues_fetch_list_widget(
//               fromDiffProfile: widget.fromDiffProfile,
//             ),
//             Queues_fetch_belowList_widget(
//               scrollController: scrollController,
//               scrollListener: scrollListener,
//               fromDiffProfile: widget.fromDiffProfile,
//             ),
//           ]),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //# Static widgets                             */
// /* -------------------------------------------------------------------------- */

//   selectQueueHeadingText() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(30.0, 15, 1.0, 0),
//       child: Text(
//         "Select a queue to join: ",
//         // maxLines: 2,
//         // overflow: TextOverflow.ellipsis,
//         // textAlign: TextAlign.center,
//         style: TextStyle(
//           color: Colors.teal[900],
//           // decoration: TextDecoration.none,
//           // fontStyle: FontStyle.italic,
//           // fontFamily: "FontNameHere" ,
//           fontWeight: FontWeight.bold,
//           // fontWeight: FontWeight.w300,
//           fontSize: 18.0,
//         ),
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                            //@ Scaffold widgets                            */
// /* -------------------------------------------------------------------------- */

//   myFab() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       child: FloatingActionButton.extended(
//         label: Row(
//           children: [Icon(Icons.add), Text('Add queues')],
//         ),
//         backgroundColor: Colors.teal[900],
//         // tooltip: "Hint text on hover ",
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return Queues_cud_screen();
//           }));
//         },
//       ),
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       centerTitle: true,
//       title: Text(
//         'Your Shop Queues', //give here appBar title
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//       // actions: [],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //@ Functionalities                            */
// /* -------------------------------------------------------------------------- */

//   void scrollListener() {
//     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//       print('list endedddd');
//       Future.delayed(Duration(milliseconds: 100), () {
//         widget.fromDiffProfile == null
//             ? BlocProvider.of<QueuesFetchBloc>(context)
//                 .add(Queues_Fetch_onInit_Event())
//             : BlocProvider.of<QueuesFetchBloc>(context).add(
//                 Queues_Fetch_onInit_fromDiffProfile_Event(
//                     widget.fromDiffProfile.id));
//       });
//     }
//   }

//   onRefreshFunc() {
//     BlocProvider.of<QueuesFetchBloc>(context)
//         .add(Queues_Fetch_onRefresh_Event());

//     //fetch again
//     widget.fromDiffProfile == null
//         ? BlocProvider.of<QueuesFetchBloc>(context)
//             .add(Queues_Fetch_onInit_Event())

//         // if from diff profile
//         : BlocProvider.of<QueuesFetchBloc>(context).add(
//             Queues_Fetch_onInit_fromDiffProfile_Event(
//                 widget.fromDiffProfile.id));

//     //add scroll listener again
//     scrollController.addListener(scrollListener);
//   }
// }
