import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AboutShopCard extends StatelessWidget {
  final prevQueueObj;
  final docsListName;
  const AboutShopCard(
      {super.key, required this.prevQueueObj, required this.docsListName});

  @override
  Widget build(BuildContext context) {
    return aboutShopCard(context);
  }

  aboutShopCard(context) {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return SizedBox(
      width: dimVar.width, //acces width
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 23, 23.0, 10),
            child: Text(
              "About this Queue:",

              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
            child: Text(
              "This queue is from shop : ${prevQueueObj.name}",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 13.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
            child: Text(
              'Max number of people who can join this queue: ${prevQueueObj.setMaxPeople}',
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 13.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
            child: Text(
              prevQueueObj.isOpen
                  ? 'Note : Queue is open to join'
                  : 'Note : Queue is closed to join',
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 13.0,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
          //   child: Text(
          //     'You joined the queue at this time : ',
          //     // maxLines: 2,
          //     // overflow: TextOverflow.ellipsis,
          //     // textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.black,
          //       // decoration: TextDecoration.none,
          //       // fontStyle: FontStyle.italic,
          //       // fontFamily: "FontNameHere" ,
          //       // fontWeight: FontWeight.bold,
          //       // fontWeight: FontWeight.w300,
          //       fontSize: 13.0,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(23, 1, 8.0, 1),
          //   child: Text(
          //     'Your id for this queue is : ',
          //     // maxLines: 2,
          //     // overflow: TextOverflow.ellipsis,
          //     // textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.black,
          //       // decoration: TextDecoration.none,
          //       // fontStyle: FontStyle.italic,
          //       // fontFamily: "FontNameHere" ,
          //       // fontWeight: FontWeight.bold,
          //       // fontWeight: FontWeight.w300,
          //       fontSize: 13.0,
          //     ),
          //   ),
          // ),

          maxPeopleProgressbar(),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  maxPeopleProgressbar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 8),
      child: LinearPercentIndicator(
        // leading: Text(
        //   'Start',
        //   textAlign: TextAlign.end,
        // ),
        // trailing: Text(
        //   'End',
        //   textAlign: TextAlign.start,
        // ),
        // center: Text(
        //   storeYourTurn == -1
        //       ? 'You are not in queue yet'
        //       : '${storeYourTurn + 1}/${docsListName.length}\n  (Your turn/total people)',
        //   style: TextStyle(
        //       color: Colors.white, fontWeight: FontWeight.bold),
        //   textAlign: TextAlign.center,
        // ),
        barRadius: Radius.circular(2),
        // width: dimVar.width,
        lineHeight: 15.0,
        // percent: (storeYourTurn + 1) / (docsListName.length),
        backgroundColor: Colors.greenAccent[100],
        progressColor: Colors.greenAccent,
      ),
    );
  }
}
