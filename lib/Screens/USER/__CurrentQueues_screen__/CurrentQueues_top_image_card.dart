import 'package:flutter/material.dart';

class CurrentQueues_top_image_card extends StatelessWidget {
  const CurrentQueues_top_image_card({super.key});

  @override
  Widget build(BuildContext context) {
    return topImageCard();
  }

  topImageCard() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 12, 25.0, 0),
            child: Card(
                elevation: 0, child: Image.asset('images/joinedQueues.jpg')),
          ),
          Align(
            child: currentQueuesHeadingText(),
            alignment: Alignment.center,
          ),
        ]);
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

  currentQueuesHeadingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Queues you have joined: ",
        //   // maxLines: 2,
        //   // overflow: TextOverflow.ellipsis,
        //   // textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: Color.fromARGB(255, 32, 7, 145),
        //     // decoration: TextDecoration.none,
        //     // fontStyle: FontStyle.italic,
        //     // fontFamily: "FontNameHere" ,
        //     fontWeight: FontWeight.bold,
        //     // fontWeight: FontWeight.w300,
        //     fontSize: 19.0,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
          child: Text(
            "All the queues which you have joined, will appear here: ",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 68, 48, 156),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 13.0,
            ),
          ),
        ),
      ],
    );
  }
}
