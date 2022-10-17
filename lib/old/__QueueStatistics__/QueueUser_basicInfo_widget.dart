// import 'package:flutter/material.dart';

// class QueueUser_basicInfo_widget extends StatelessWidget {
//   // final shopObj;
//   final queueObj;
//   const QueueUser_basicInfo_widget({
//     super.key,
//     // required this.shopObj,
//     required this.queueObj,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return myCard(context);
//   }

//   myCard(context) {
//     var dimVar = MediaQuery.of(context).size;

// //height : dimVar.height*0.5    //to access height
// //width : dimVar.width*0.5       //acces width
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Container(
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//               child: SizedBox(
//                 width: dimVar.width,
//                 child: Text(
//                   "About : ",
//                   // maxLines: 2,
//                   // overflow: TextOverflow.ellipsis,
//                   // textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     // decoration: TextDecoration.none,
//                     // fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 20.0,
//                   ),
//                 ),
//               ),
//             ),
//             // Text('Shop name :  '),
//             // Text('Category name :  '),
//             // Text('Address :  '),
//             // Text('City :  '),
//             // Text('Pincode  '),
//             // Divider(),
//             Text('Queue name :  ${queueObj.name} '),
//             Text('Queue description :  ${queueObj.description}'),
//             Text(queueObj.isOpen ? 'Queue is open' : 'Queue is closed'),
//             Text('Max people : ${queueObj.setMaxPeople}'),
//             Text('Total people in queue : ${queueObj.totalPeople} '),
//           ]),
//         ),
//       ),
//     );
//   }
// }
