import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QueueStats_myTurnCard extends StatelessWidget {
  final queueUserObj;
  const QueueStats_myTurnCard({
    super.key,
    required this.queueUserObj,
  });

  @override
  Widget build(BuildContext context) {
    return stats_card_structure();
  }

  stats_card_structure() {
    return Card(
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yourTurn_textHeading(),
                  statsText(),
                ],
              ),
              yourTurn_CircleBatch()
            ],
          ),
          yourTurnBar()
        ],
      ),
    );
  }

  yourTurnBar() {
    return Padding(
      // padding: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.fromLTRB(15.0, 10, 15.0, 30),
      child: Tooltip(
        message: 'Your number in queue is : ${queueUserObj.myTurn}',
        triggerMode: TooltipTriggerMode.tap,
        child: new LinearPercentIndicator(
          // leading: Text(
          //   'Start',
          //   textAlign: TextAlign.end,
          // ),
          // trailing: Text(
          //   'End',
          //   textAlign: TextAlign.start,
          // ),
          center: Text(
            '${queueUserObj.myTurn}/${queueUserObj.queueCount}\n  (Your turn/total people)',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          barRadius: Radius.circular(2),
          // width: dimVar.width,
          lineHeight: 45.0,
          percent: (queueUserObj.myTurn) / (queueUserObj.queueCount),
          backgroundColor: Colors.greenAccent[100],
          progressColor: Colors.greenAccent,
        ),
      ),
    );
  }

  yourTurn_CircleBatch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 35.0, 1),
      child: CircleAvatar(
        radius: 38,
        backgroundColor: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 37,
            backgroundColor: Colors.white,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    Text(
                      'Your turn:',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '${queueUserObj.myTurn}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  statsText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
          child: Text(
            'total people in queue : ${queueUserObj.queueCount}',
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
              // fontSize: 20.0,
              fontSize: 13.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
          child: Text(
            'average time per person : N/A',
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
              // fontSize: 20.0,
              fontSize: 13.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
          child: Text(
            'estimated time for your turn : N/A',
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
              // fontSize: 20.0,
              fontSize: 13.0,
            ),
          ),
        ),
      ],
    );
  }

  yourTurn_textHeading() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23.0, 23, 23, 15),
      child: Text(
        "Your turn in queue:",
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
    );
  }
}
