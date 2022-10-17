import 'package:flutter/material.dart';

import '../../../ADMIN/__QueueStats__/QueueStats_main.dart';

// import '../../../ADMIN/__QueueUserFetchScreen__/QueueUser_firebase_fetchProp_screen.dart';

class CurrentQueues_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const CurrentQueues_fetch_listTile_widget(
      {super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return new_gridTile_ui(context);
  }

  new_gridTile_ui(context) {
    return GestureDetector(
      onTap: () {
        gridTile_onTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // color: Colors.grey.withOpacity(0.5),
                color: Color.fromARGB(255, 204, 204, 204).withOpacity(0.5),

                spreadRadius: 1.2,
                blurRadius: 1.2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            // borderRadius: BorderRadius.all(Radius.circular(2)),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(10),
            //   topRight: Radius.circular(10),
            //   bottomLeft: Radius.circular(10),
            //   bottomRight: Radius.circular(10),
            // ),
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 145, 105, 240),
              // Color.fromARGB(255, 111, 56, 182),

              //older
              // Colors.greenAccent,
              // Color.fromARGB(255, 60, 201, 133),

              //new ( actual backup)
              // Color.fromARGB(255, 210, 173, 252),
              // Color.fromARGB(255, 166, 110, 240),

              // Pink (imp)
              // Color.fromARGB(255, 210, 173, 252),
              // Color.fromARGB(255, 166, 110, 240)

              //
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 240, 240, 240)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(child: gridTileContent()),
        ),
      ),
    );
  }

  gridTile_ui(context) {
    return GestureDetector(
      onTap: () {
        gridTile_onTap(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 145, 105, 240),
              // Color.fromARGB(255, 111, 56, 182),

              //older
              // Colors.greenAccent,
              // Color.fromARGB(255, 60, 201, 133),

              //new
              Color.fromARGB(255, 210, 173, 252),
              Color.fromARGB(255, 166, 110, 240),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(child: gridTileContent()),
        ),
      ),
    );
  }

  gridTileContent() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child:
          // ),
          SizedBox(height: 2),
          Text(
            '${singleObj.queue_name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              // color: Colors.deepPurple,
              // color: Colors.teal[900],
              color: Color.fromARGB(255, 76, 82, 95),
              // color: Color.fromARGB(255, 90, 97, 112),
              // color: Color.fromARGB(255, 0, 16, 41),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 15.0,
            ),
          ),
          // SizedBox(
          //   height: 2,
          // ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 1, 1),
            child: Text(
              'by ${singleObj.adminAcc_name}'.length >= 23
                  ? 'by ${singleObj.adminAcc_name}'.substring(0, 23)
                  : 'by ${singleObj.adminAcc_name}',

              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                // color: Color.fromARGB(255, 255, 240, 245),
                // color: Color.fromARGB(255, 196, 196, 196),
                color: Colors.grey,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontStyle: thic,
                // fontWeight: FontWeight.w300,
                fontSize: 8.5,
              ),
            ),
          ),
          // SizedBox(
          //   height: 2,
          // ),

          Divider(),
          // Spacer(),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 1.1,
                shadowColor: Colors.blueGrey,

                color: Colors.white,

                // color: Color.fromARGB(255, 247, 247, 247),
                child: CircleAvatar(
                  radius: 10,
                  // backgroundColor: Color.fromARGB(255, 247, 247, 247),
                  backgroundColor: Colors.white,
                  child: FittedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '${singleObj.myTurn}/${singleObj.queueCount}',
                      style: TextStyle(
                        // color: Color.fromARGB(255, 145, 145, 145),
                        // color: Colors.grey,
                        color: Colors.blue[900],
                      ),
                    ),
                  )),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: FittedBox(
                  child: Text(
                    // for prev
                    singleObj.joinedTime == 'time added'
                        ? 'time added'

                        // new time
                        // : "Joined time :\n${listArg[i].joinedTime.substring(0, 11)}"

                        :
                        // 'Joined time :\n' +
                        '${singleObj.joinedTime.substring(0, 11)}' +
                            '\n'
                                '${singleObj.joinedTime.substring(13)}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      // color: Colors.white,
                      color: Colors.grey,

                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */
  gridTile_onTap(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QueueStats_main.fromCurrentUserTile(
        queue_Id: singleObj.queue_fk,
        fromAdminShop: false,
        fromCurrentUserTile: true,
        queueUserObj: singleObj,
      );
    }));
  }
}
