import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__CurrentQueues_screen__/CurrentQueues_top_image_card.dart';
import 'package:no_queue2/sample.dart';

import '../../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import '../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
import '../../../Logic/ADMIN/__QueueUserFetch__/CurrentQueues_fetch_logic/CurrentQueues_fetch_bloc.dart';
import '../../../Repository_layer/UserAcc_repo.dart';
import 'CurrentQueues_sliverAppBar.dart';
import 'UserHomeSearchBar.dart';
import '../../../service_layer/models/UserAcc.dart';
import '../../USER_AUTH/Settings_screen.dart';
import '../__Search_shop_screen__/Search_shop_screen.dart';
import 'CurrentQueues_fetch_fetchList/CurrentQueues_fetch_belowList_widget.dart';
import 'CurrentQueues_fetch_fetchList/CurrentQueues_fetch_list_widget.dart';

class CurrentQueues_screen extends StatefulWidget {
  const CurrentQueues_screen({Key? key}) : super(key: key);

  @override
  _CurrentQueues_screenState createState() => _CurrentQueues_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _CurrentQueues_screenState extends State<CurrentQueues_screen> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  getUserAcc_name() async {
    //!  get SP : user name from sp
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    UserAcc userObj = await userAcc_sp_repo.spGet_UserAccObj();

    //Bloc
    BlocProvider.of<SpBlocProviderBloc>(context)
        .add(sp_userAccObj_Store_Event(userObj));
  }

  @override
  void initState() {
    super.initState();

    //# refresh earlier list
    BlocProvider.of<CurrentQueuesFetchBloc>(context)
        .add(CurrentQueues_Fetch_onRefresh_Event());

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<CurrentQueuesFetchBloc>(context)
        .add(CurrentQueues_Fetch_onInit_Event());
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.amber,
      backgroundColor: Color(0xfff5f7f9),
      // resizeToAvoidBottomInset: false,
      body: body_STATES(),

      // floatingActionButton: myFab(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  //@ Body                                  */
/* -------------------------------------------------------------------------- */

  body_STATES() {
    return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
        listener: (context, state) {
      if (state is QueueUser_create_Loaded_State ||
          state is QueueUser_update_Loaded_State ||
          state is QueueUser_Delete_Loaded_state) {
        onRefreshFunc();
      }
    }, builder: (context, state) {
      return myBody();
    });
  }

  myBody() {
    var dimVar = MediaQuery.of(context).size;

    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: CustomScrollView(
        // note : make sure to pass controller in this list
        controller: scrollController,
        slivers: [
          // header

          CurrentQueues_sliverAppBar(),

          SliverToBoxAdapter(child: fakeRoundedCorners()),

          //
          SliverToBoxAdapter(child: yourJoinedQueues_text()),

          //
          SliverToBoxAdapter(
            child: CurrentQueues_fetch_list_widget(),
          ),

          //
          SliverToBoxAdapter(
            child: CurrentQueues_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener),
          ),

          //

          SliverToBoxAdapter(child: SizedBox(height: dimVar.height * 0.7)),
          // SliverToBoxAdapter(child: Divider()),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                            //@ Scaffold widgets                            */
/* -------------------------------------------------------------------------- */

  fakeRoundedCorners() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 30,
          color: Color.fromARGB(113, 3, 8, 31).withOpacity(0.87),
        ),
        Container(
          height: 33,
          decoration: BoxDecoration(
            // color: Colors.amber,
            color: Color(0xfff5f7f9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
          ),
        ),
      ],
    );
  }

  yourJoinedQueues_text() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 0, 8.0, 10),
      child: Text(
        'Your joined queues : ',
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          // color: Color.fromARGB(255, 148, 148, 148),
          color: Color.fromARGB(255, 23, 0, 87),
          // decoration: TextDecoration.underline,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 20.0,
        ),
      ),
    );
  }

  myFab() {
    return FloatingActionButton.extended(
      label: Row(
        children: [Text('Search shop  '), Icon(Icons.search)],
      ),
      // child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      // tooltip: "Hint text on hover ",
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Search_shop_screen();
        }));
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(Duration(milliseconds: 100), () {
        BlocProvider.of<CurrentQueuesFetchBloc>(context)
            .add(CurrentQueues_Fetch_onInit_Event());
      });
    }
  }

  onRefreshFunc() {
    BlocProvider.of<CurrentQueuesFetchBloc>(context)
        .add(CurrentQueues_Fetch_onRefresh_Event());
    BlocProvider.of<CurrentQueuesFetchBloc>(context)
        .add(CurrentQueues_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }

/* -------------------------------------------------------------------------- */
/*                              //@ about slivers                             */
/* -------------------------------------------------------------------------- */

}
