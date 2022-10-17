// import 'package:flutter/material.dart';

// class QueueUser_leaderboard_widget extends StatelessWidget {
//   final listArg;
//   const QueueUser_leaderboard_widget({super.key, required this.listArg});

//   @override
//   Widget build(BuildContext context) {
//     return firstThreePerson();
//   }

//   firstThreePerson() {
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
//               firstThreePersonSingleDesign(2, 'Next :',
//                   listArg.length < 2 ? 'Emtpy' : '${listArg[1].userAcc_name}'),

//               //@ 1 person
//               firstThreePersonSingleDesign(
//                   1,
//                   'Current :',
//                   listArg.length == 0
//                       ? 'Queue is Empty'
//                       : '${listArg[0].userAcc_name}',
//                   isCenter: true),

//               //@ 3 person

//               firstThreePersonSingleDesign(3, 'Next to next :',
//                   listArg.length < 3 ? 'Emtpy' : '${listArg[2].userAcc_name}')
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
// }
