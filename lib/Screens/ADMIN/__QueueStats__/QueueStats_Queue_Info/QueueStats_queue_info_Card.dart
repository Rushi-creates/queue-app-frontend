import 'package:flutter/material.dart';

class QueueStats_queue_info_card extends StatelessWidget {
  final modelObj;
  const QueueStats_queue_info_card({super.key, required this.modelObj});

  @override
  Widget build(BuildContext context) {
    return buildFetchObj(context);
  }

  buildFetchObj(context) {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      height: dimVar.height * 0.2,
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'About Queue:',
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
                Text('name: ${modelObj.name}',
                    style: TextStyle(color: Colors.teal[900])),
                Text('Description: ${modelObj.description}',
                    style: TextStyle(color: Colors.teal[900])),
                Text('Max people who can join:${modelObj.setMaxPeople}',
                    style: TextStyle(color: Colors.teal[900])),
                Text(modelObj.isOpen ? 'Queue is open' : 'Queue is closed',
                    style: TextStyle(color: Colors.teal[900])),
                Text('Total people in queue: ${modelObj.totalPeople}',
                    style: TextStyle(color: Colors.teal[900])),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
