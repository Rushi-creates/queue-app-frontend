import 'package:flutter/material.dart';

//to change class name = right click on className> Rename symbol
class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f7f9),

      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(child: new_gridTile_ui(context), flex: 1),
                Flexible(child: new_gridTile_ui(context), flex: 1),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(child: new_gridTile_ui(context), flex: 1),
                Flexible(child: new_gridTile_ui(context), flex: 1),
              ],
            ),
          ],
        )),
      ),
    ));
  }

  new_gridTile_ui(context) {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return GestureDetector(
      onTap: () {
        // gridTile_onTap(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 120,
          // width: 240,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 204, 204, 204).withOpacity(0.5),
                    // color: Color.fromARGB(255, 181, 163, 250).withOpacity(0.5),
                    // color: Color.fromARGB(255, 223, 215, 255).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(2)),
                gradient: LinearGradient(colors: [
                  // Color.fromARGB(255, 145, 105, 240),
                  // Color.fromARGB(255, 111, 56, 182),

                  //older
                  // Colors.greenAccent,
                  // Color.fromARGB(255, 60, 201, 133),

                  //new ( actual backup)
                  // Color.fromARGB(255, 210, 173, 252),
                  // Color.fromARGB(255, 166, 110, 240),

                  //
                  // Color.fromARGB(255, 248, 243, 253),
                  // Color.fromARGB(255, 223, 215, 255),

                  //
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 240, 240, 240)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(child: gridTileContent()),
            ),
          ),
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
          SizedBox(height: 5),
          Text(
            'Sports',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 16, 41),
              // color: Colors.teal[900],
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 16.0,
            ),
          ),
          // SizedBox(
          //   height: 2,
          // ),

          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'by admin2@gmail.com'
              // + '${singleObj.adminAcc_name}'s
              ,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                // color: Color.fromARGB(255, 138, 138, 138),

                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 10.0,
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
                color: Colors.white,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: FittedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('1/4'),
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
                    '07:14:25 PM, \nWed, 31/8/2022',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 9.0,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Home', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }
}
