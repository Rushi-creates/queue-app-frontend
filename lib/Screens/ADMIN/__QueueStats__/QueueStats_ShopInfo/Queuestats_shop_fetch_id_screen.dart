import '../../../../Logic/ADMIN/__QueuesFetch__/Admin_fetch_id_logic/admin_fetch_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class Queuestats_shop_fetch_id_screen extends StatefulWidget {
  final shopAdmin_id;
  const Queuestats_shop_fetch_id_screen({Key? key, required this.shopAdmin_id})
      : super(key: key);

  @override
  _Queuestats_shop_fetch_id_screenState createState() =>
      _Queuestats_shop_fetch_id_screenState();
}

class _Queuestats_shop_fetch_id_screenState
    extends State<Queuestats_shop_fetch_id_screen> {
  // int sp_id = 1;    // dummy id stored

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdminFetchIdBloc>(context)
        .add(Admin_FetchById_onButtonPressed_Event(widget.shopAdmin_id));
  }

  @override
  Widget build(BuildContext context) {
    return states_for_fetchSingleById();
  }

  states_for_fetchSingleById() {
    return BlocConsumer<AdminFetchIdBloc, AdminFetchIdState>(
      listener: (context, state) {
        if (state is Admin_FetchById_Error_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Admin_FetchById_Error_State) {
          return connectionErrorText(state.error);
        } else if (state is Admin_FetchById_Loading_State) {
          return buildLoading();
        } else if (state is Admin_FetchById_Loaded_State) {
          return buildFetchObj(state.modelObj);
        }
        return buildLoading();
      },
    );
  }

  buildFetchObj(modelObj) {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
      height: dimVar.height * 0.2,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Container(
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About shop:',
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
                  Text('Shop name : ${modelObj.companyName}',
                      style: TextStyle(color: Colors.teal[900])),
                  Text('Category : ${modelObj.category}',
                      style: TextStyle(color: Colors.teal[900])),
                  Text('Address : ${modelObj.loc_firstLine}',
                      style: TextStyle(color: Colors.teal[900])),
                  Text('City : ${modelObj.loc_secondLine}',
                      style: TextStyle(color: Colors.teal[900])),
                  Text('Pincode : ${modelObj.loc_pincode}',
                      style: TextStyle(color: Colors.teal[900])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  connectionErrorText(error) {
    return Center(
      child: Text(
        'Connection error or \n Error: $error',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Fetch by id', //give here appBar title
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
