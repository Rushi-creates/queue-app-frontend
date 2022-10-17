// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// //to change class name = right click on className> Rename symbol
// class NetstateScreen extends StatefulWidget {
//   const NetstateScreen({Key? key}) : super(key: key);

//   @override
//   _NetstateScreenState createState() => _NetstateScreenState();
// }

// class _NetstateScreenState extends State<NetstateScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       appBar: myHeader(),
//       body: myBody(),
//     );
//   }

//   myBody() {
//     return Center(
//       child: BlocConsumer<InternetBloc, InternetState>(
//         listener: (context, state) {
//           //todo: implement listener  ( use to print/sncakbar/logic , when we dont want to return another widget)
//           if (state is InternetGainState) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('Internet connected'),
//                 backgroundColor: Colors.green));
//           } else if (state is InternetLossState) {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('Connection lost'), backgroundColor: Colors.red));
//           }
//         },
//         builder: (context, state) {
//           //todo : use to return a widget
//           if (state is InternetGainState) {
//             return Text('Connected to internet');
//           } else if (state is InternetLossState) {
//             return Text('Connection lost');
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),

//       //  BlocBuilder<InternetBloc, InternetState>(
//       //   builder: (context, state) {
//       //
//       //   },
//       // ),
//     );
//   }

//   AppBar myHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       // elevation: 0.0,
//       //leading: IconButton(
//       //  icon: Icon(
//       //   Icons.arrow_back,
//       //   color: Colors.black,
//       //   ),
//       //   onPressed: (){
//       //       Navigator.pop(context);
//       //   }
//       // ),
//       // automaticallyImplyLeading: true,  //removes default back arrow on appbar

//       title: Text(
//         'Home', //give here appBar title
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
// }

// class InternetLossState {}
