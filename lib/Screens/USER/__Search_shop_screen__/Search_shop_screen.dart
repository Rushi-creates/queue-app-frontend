import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__Search_shop_screen__/SearchAdmin_fetch_fetchList/SearchAdmin_fetch_belowList_widget.dart';
import 'package:no_queue2/Screens/USER/__Search_shop_screen__/SearchAdmin_fetch_fetchList/SearchAdmin_fetch_fetchList_widget.dart';
import 'package:no_queue2/Screens/USER_AUTH/Settings_screen.dart';

import '../../../Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';
import 'Search_shop_searchBar_widget.dart';

class Search_shop_screen extends StatefulWidget {
  const Search_shop_screen({Key? key}) : super(key: key);

  @override
  _Search_shop_screenState createState() => _Search_shop_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _Search_shop_screenState extends State<Search_shop_screen> {
  final ScrollController scrollController = ScrollController();

  TextEditingController searchAdminController = TextEditingController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    print('scroll controller disposed');
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(Duration(milliseconds: 100), () {
        BlocProvider.of<SearchAdminFetchBloc>(context)
            .add(SearchAdmin_Fetch_onInit_Event(searchAdminController.text));
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //@ Search bar
              Search_shop_searchBar_widget(
                  searchAdminController: searchAdminController),

              //@ actual list
              SearchAdmin_fetch_list_widget(),

              //@ below list
              SearchAdmin_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
                searchAdminController: searchAdminController,
              )
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! Body widgets                              */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Search admin shops', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return SettingScreen();
        //         }));
        //       },
        //       icon: Icon(
        //         Icons.settings,
        //         color: Colors.black,
        //       )),
        // )
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         BlocProvider.of<SearchAdminFetchPropBloc>(context)
        //             .add(SearchAdmin_FetchProp_More_onListEnd_Event());
        //       },
        //       icon: Icon(
        //         Icons.refresh,
        //         color: Colors.black,
        //       )),
        // )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Static Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<SearchAdminFetchBloc>(context)
        .add(SearchAdmin_Fetch_onRefresh_Event());
    BlocProvider.of<SearchAdminFetchBloc>(context)
        .add(SearchAdmin_Fetch_onInit_Event(searchAdminController.text));
    scrollController.addListener(scrollListener);
  }
}
