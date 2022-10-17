import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Global_blocProviders/bloc/diff_profile_bloc.dart';
import '../../../ADMIN/__AdminVerifyScreen__/AdminVerify_widget.dart';

class SearchAdmin_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const SearchAdmin_fetch_listTile_widget({super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return singleListTile_decoration(singleObj, context);
  }

  singleListTile_decoration(singleObj, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 3.5, 8.0, 3.5),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.teal,
              // Color.fromARGB(255, 0, 230, 142),
              Color.fromARGB(255, 0, 219, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: basicListTile(context),
      ),
    );
  }

  basicListTile(context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 6,
            child: ListTile(
              // tileColor: Colors.teal,
              leading: tile_leading(),
              title: tile_title(),
              subtitle: tile_subtitle(),
              trailing: tile_trailing(),
              onTap: () async => await fetchListFunc(singleObj, context),
            ),
          ),
          // Flexible(
          //   child: Image.asset('images/travel_queue.jpg'),
          //   flex: 3,
          // )
        ],
      ),
    );
  }

  tile_leading() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: FittedBox(
          child: Text(
        singleObj.id.toString(),
        style: TextStyle(
          color: Colors.teal[900],
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  tile_title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
      child: Text(
        singleObj.companyName,

        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 21.0,
        ),
      ),
    );
  }

  tile_subtitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                singleObj.loc_firstLine,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                    // color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    // fontSize: 10,
                    ),
              ),
              Text(
                '   |   ',
                // style: TextStyle(color: Colors.white),
              ),
              Text(
                singleObj.loc_secondLine,
                maxLines: 1,
              ),
              // Text(
              //   '  |  ',
              //   // style: TextStyle(color: Colors.white),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
            child: Divider(),
          ),
          // SizedBox(height: 4),
          Text(
            'Pincode: ${singleObj.loc_pincode}',
            maxLines: 1,
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  tile_trailing() {
    return Card(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.teal[900],
                size: 30,
              ),
              onPressed: null,
            ),
          ),
        ),
      ),
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                             //@ functionalites                             */
  /* -------------------------------------------------------------------------- */

  fetchListFunc(listTileInfo, context) async {
    //# storing current visiting profile's info in global provider
    BlocProvider.of<DiffProfileBloc>(context)
        .add(diffProfile_Store_Event(listTileInfo));

    await Future.delayed(Duration(milliseconds: 200));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminVerifyScreen();
    }));
  }
}
