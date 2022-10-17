import 'package:flutter/material.dart';
import 'package:no_queue2/Screens/ADMIN/QueueUser_cud_screen.dart';
import 'package:no_queue2/old/__QueueStatistics__/QueueUser_fetch_screen.dart';
import 'package:super_banners/super_banners.dart';

import '../../Queues_cud_screen.dart';
import '../../__QueueStats__/QueueStats_main.dart';

class Queues_fetch_listTile_widget extends StatelessWidget {
  final fromDiffProfile;
  final singleObj;
  const Queues_fetch_listTile_widget({
    super.key,
    required this.fromDiffProfile,
    required this.singleObj,
  });

  @override
  Widget build(BuildContext context) {
    return singleListTile(context);
  }

  singleListTile(context) {
    return GestureDetector(
      onTap: () => tileOnTap_FUNC(context),
      child: Card(
        color: Colors.greenAccent,
        elevation: 4,
        // margin: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // queueImageDesgin(),
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child:
                      // ),
                      SizedBox(height: 4),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${singleObj.name}', // set 8 letter word condition
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    // decoration: TextDecoration.none,
                                    // fontStyle: FontStyle.italic,
                                    // fontFamily: "FontNameHere" ,
                                    fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  // set condition for 28 letter description
                                  '${singleObj.description}',
                                  // 'once was a ship that was put to sea, and name
                                  //of the ship was billy-o-ty , soon when the wheeler-men
                                  //come to bring the sugar and tea and rum',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // decoration: TextDecoration.none,
                                    // fontStyle: FontStyle.italic,
                                    // fontFamily: "FontNameHere" ,
                                    // fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),

                          // Flexible(
                          //   flex: 1,
                          //   child: Align(
                          //     alignment: Alignment.topRight,
                          //     child: Container(
                          //       color: Colors.white,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(2.5),
                          //         child: FittedBox(
                          //           child: Text(
                          //             singleObj.isOpen ? ' Open ' : 'Closed',
                          //             // maxLines: 2,
                          //             // overflow: TextOverflow.ellipsis,
                          //             // textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               color: Colors.teal[900],
                          //               // decoration: TextDecoration.none,
                          //               // fontStyle: FontStyle.italic,
                          //               // fontFamily: "FontNameHere" ,
                          //               fontWeight: FontWeight.bold,
                          //               // fontWeight: FontWeight.w300,
                          //               fontSize: 7.0,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),

                      SizedBox(
                        height: 1,
                      ),
                      // Spacer(),
                      Divider(
                          // thickness: 1,
                          ),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  singleObj.isOpen ? 'Open' : 'Closed',
                                  // maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // decoration: TextDecoration.none,
                                    // fontStyle: FontStyle.italic,
                                    // fontFamily: "FontNameHere" ,
                                    // fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  //@ null check imp
                                  'Total people : ${singleObj.totalPeople ?? '0'}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // decoration: TextDecoration.none,
                                    // fontStyle: FontStyle.italic,
                                    // fontFamily: "FontNameHere" ,
                                    // fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  'Max people : ${singleObj.setMaxPeople}',
                                  // maxLines: 2,
                                  // overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    // decoration: TextDecoration.none,
                                    // fontStyle: FontStyle.italic,
                                    // fontFamily: "FontNameHere" ,
                                    // fontWeight: FontWeight.bold,
                                    // fontWeight: FontWeight.w300,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 5),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Align(
                            //       alignment: Alignment.topRight,
                            //       child: Padding(
                            //         padding:
                            //             const EdgeInsets.fromLTRB(2, 2, 4, 0),
                            //         child: Container(
                            //           color: Colors.white,
                            //           child: Padding(
                            //             // padding: const EdgeInsets.all(2.5),
                            //             padding: const EdgeInsets.fromLTRB(
                            //                 2, 2, 2, 2),
                            //             child: FittedBox(
                            //               child: Text(
                            //                 singleObj.isOpen
                            //                     ? '    Open   '
                            //                     : '   Closed  ',
                            //                 // maxLines: 2,
                            //                 // overflow: TextOverflow.ellipsis,
                            //                 // textAlign: TextAlign.center,
                            //                 style: TextStyle(
                            //                   color: Colors.teal[900],
                            //                   // decoration: TextDecoration.none,
                            //                   // fontStyle: FontStyle.italic,
                            //                   // fontFamily: "FontNameHere" ,
                            //                   fontWeight: FontWeight.bold,
                            //                   // fontWeight: FontWeight.w300,
                            //                   fontSize: 7.0,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            fromDiffProfile == null
                                ? Card(
                                    color: Colors.white,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: FittedBox(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                              // size: 10,
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Queues_cud_screen.named(
                                                    singleObj: singleObj);
                                              }));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : joinQueue_addButton(context),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            // CornerBanner(
            //   elevation: 10,
            //   bannerPosition: CornerBannerPosition.topRight,
            //   bannerColor: Colors.teal,
            //   child: Padding(
            //     padding: const EdgeInsets.all(2.0),
            //     child: Text(
            //       singleObj.isOpen ? ' Open ' : 'Closed',
            //       // maxLines: 2,
            //       // overflow: TextOverflow.ellipsis,
            //       // textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Colors.white,
            //         // decoration: TextDecoration.none,
            //         // fontStyle: FontStyle.italic,
            //         // fontFamily: "FontNameHere" ,
            //         fontWeight: FontWeight.bold,
            //         // fontWeight: FontWeight.w300,
            //         fontSize: 8.0,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  joinQueue_addButton(context) {
    return Card(
      color: Colors.white,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: FittedBox(
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return QueueUser_cud_screen(
                  fromDiffProfile: fromDiffProfile,
                  propOfQueue: singleObj,
                );
              }));
            },
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  tileOnTap_FUNC(context) {
    //! for django api
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QueueStats_main(
        queueObj: singleObj,
        queue_Id: singleObj.id,
        fromDiffProfile: fromDiffProfile,
        fromAdminShop: fromDiffProfile == null ? true : false,
        fromCurrentUserTile: false,
      );
    }));

    // //! for django api
    // fromDiffProfile == null
    //     ? Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         return QueueUser_Fetch_Screen(singleQueueObj: singleObj);
    //       }))
    //     : null;

    //! for firebase
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return QueueUser_firebase_fetchProp_Screen.admin_QueueObj(
    //       fromDiffProfile: fromDiffProfile == null ? null : fromDiffProfile,
    //       admin_QueueObj: singleObj);
    // }));
  }
}
