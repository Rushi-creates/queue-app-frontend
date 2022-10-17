// import '../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
// import '../../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
// import '../../../Repository_layer/UserAcc_repo.dart';
// import '../../../service_layer/models/UserAcc.dart';
// import 'QueueUser_basicInfo_widget.dart';
// import 'QueueUser_fetch_fetchList/QueueUser_fetch_belowList_widget.dart';
// import 'QueueUser_fetch_fetchList/QueueUser_fetch_fetchList_widget.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class QueueUser_Fetch_Screen extends StatefulWidget {
//   final singleQueueObj;
//   const QueueUser_Fetch_Screen({
//     Key? key,
//     required this.singleQueueObj,
//   }) : super(key: key);

//   @override
//   _QueueUser_Fetch_ScreenState createState() => _QueueUser_Fetch_ScreenState();
// }

// /* -------------------------------------------------------------------------- */
// /*                               //! State class                              */
// /* -------------------------------------------------------------------------- */

// class _QueueUser_Fetch_ScreenState extends State<QueueUser_Fetch_Screen> {
//   final ScrollController scrollController = ScrollController();

//   var store_userId;

// /* -------------------------------------------------------------------------- */
// /*                            //! lifecycle methods                           */
// /* -------------------------------------------------------------------------- */

//   @override
//   void initState() {
//     super.initState();

//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onRefresh_Event());

//     getMyUser();

//     //# a scroll listner which listens always
//     scrollController.addListener(scrollListener);

//     //# to call first set of pages
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onInit_Event(widget.singleQueueObj.id));
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
//             .add(QueueUser_Fetch_onInit_Event(widget.singleQueueObj.id));
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
//       body: myBody_STATES(),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //! body structure                             */
// /* -------------------------------------------------------------------------- */

//   myBody_STATES() {
//     return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
//       listener: (context, state) {
//         if (state is QueueUser_create_Loaded_State ||
//             state is QueueUser_update_Loaded_State ||
//             state is QueueUser_Delete_Loaded_state) {
//           onRefreshFunc();
//         }
//       },
//       builder: (context, state) {
//         return myBody();
//       },
//     );
//   }

//   myBody() {
//     return RefreshIndicator(
//       onRefresh: () async {
//         print('Refreshed');
//         onRefreshFunc();
//       },
//       child: SingleChildScrollView(
//         // controller: scrollController,
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               QueueUser_basicInfo_widget(
//                 // shopObj:  ,
//                 queueObj: widget.singleQueueObj,
//               ),
//               QueueUser_fetch_fetchList_widget(
//                 singleQueueObj: widget.singleQueueObj,
//                 scrollController: scrollController,
//                 scrollListener: scrollListener,
//                 store_userId: store_userId,
//               ),
//             ]),
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //@ Widgets                                */
// /* -------------------------------------------------------------------------- */

// /* -------------------------------------------------------------------------- */
// /*                             //@ Static widgets                             */
// /* -------------------------------------------------------------------------- */

// /* -------------------------------------------------------------------------- */
// /*                           //# Scaffold widgets                             */
// /* -------------------------------------------------------------------------- */

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       automaticallyImplyLeading: false,
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
//         'Queue Statistics',
//         style: TextStyle(
//           color: Colors.black,
//           // fontWeight: FontWeight.bold
//           fontSize: 15,
//         ),
//       ),
//       // actions: [
//       //   Padding(
//       //     padding: const EdgeInsets.all(8.0),
//       //     child: IconButton(
//       //         onPressed: () {
//       //           // Navigator.pushNamed(context, '/Home');
//       //         },
//       //         icon: Icon(
//       //           Icons.settings,
//       //           color: Colors.black,
//       //         )),
//       //   )
//       //   // Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: IconButton(
//       //       onPressed: () {
//       //         onRefreshFunc()
//       //       },
//       //       icon: Icon(
//       //         Icons.refresh,
//       //         color: Colors.black,
//       //       )),
//       // )
//       // ],
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                         //# Sttic Helper functions                         */
// /* -------------------------------------------------------------------------- */

//   onRefreshFunc() {
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onRefresh_Event());
//     BlocProvider.of<QueueUserFetchBloc>(context)
//         .add(QueueUser_Fetch_onInit_Event(widget.singleQueueObj.id));
//     scrollController.addListener(scrollListener);
//   }

//   getMyUser() async {
//     UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
//     UserAcc? myUser = await userAcc_sp_repo.spGet_UserAccObj();
//     store_userId = myUser?.id;
//   }
// }
