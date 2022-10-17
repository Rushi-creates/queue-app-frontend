import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueStats_Queue_Info/QueueStats_queue_info_Card.dart';
import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueStats_ShopInfo/Queuestats_shop_fetch_id_screen.dart';
import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueStats_myTurnCard.dart';
import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueUser_fetch_fetchList/QueueUser_fetch_fetchList_widget.dart';
import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueStats_Queue_Info/Queue_fetch_id_screen.dart';

import '../../../Global_blocProviders/Funcs.dart';
import '../../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
import '../../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Repository_layer/UserAcc_repo.dart';
import '../../../service_layer/models/UserAcc.dart';
import 'QueueStats_ShopInfo/Queuestats_shopInfo_card.dart';

class QueueStats_main extends StatefulWidget {
  final queue_Id;
  final queueObj;
  final fromAdminShop;
  final fromDiffProfile;
  final fromCurrentUserTile;
  final queueUserObj;
  const QueueStats_main(
      {Key? key,
      this.queueUserObj,
      required this.queueObj,
      required this.queue_Id,
      required this.fromDiffProfile,
      required this.fromAdminShop,
      required this.fromCurrentUserTile})
      : super(key: key);

  QueueStats_main.fromCurrentUserTile({
    this.queueObj,
    this.fromDiffProfile,
    required this.queue_Id,
    required this.fromAdminShop,
    required this.fromCurrentUserTile,
    required this.queueUserObj,
  });

  @override
  _QueueStats_mainState createState() => _QueueStats_mainState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _QueueStats_mainState extends State<QueueStats_main> {
  final ScrollController scrollController = ScrollController();

  var store_userId;

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    BlocProvider.of<QueueUserFetchBloc>(context)
        .add(QueueUser_Fetch_onRefresh_Event());

    getMyUser();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<QueueUserFetchBloc>(context)
        .add(QueueUser_Fetch_onInit_Event(widget.queue_Id));
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
        BlocProvider.of<QueueUserFetchBloc>(context)
            .add(QueueUser_Fetch_onInit_Event(widget.queue_Id));
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    print('hahhahahah=>$store_userId');
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody_STATES(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  myBody_STATES() {
    // var store_userId = await Funcs.getMySp_user();

    return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
      listener: (context, state) {
        if (state is QueueUser_create_Loaded_State ||
            state is QueueUser_update_Loaded_State ||
            state is QueueUser_Delete_Loaded_state) {
          onRefreshFunc();
        }
      },
      builder: (context, state) {
        return myBody();
      },
    );
  }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SingleChildScrollView(
        // controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //

              //
              widget.fromCurrentUserTile
                  ? QueueStats_myTurnCard(queueUserObj: widget.queueUserObj)
                  : Container(),

              //

              QueueUser_fetch_fetchList_widget(
                store_userId: store_userId,
                queue_Id: widget.queue_Id,
                scrollController: scrollController,
                fromAdminShop: widget.fromAdminShop,
                scrollListener: scrollListener,
              ),

              //

              //

              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //

                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.fromCurrentUserTile
                        ? Queuestats_shop_fetch_id_screen(
                            shopAdmin_id: widget.queueUserObj.adminAcc_fk)
                        : QueueStats_shopInfo_card(
                            fromAdminShop: widget.fromDiffProfile,
                          ),
                  ),

                  //
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: widget.fromCurrentUserTile
                        ? Queue_FetchId_Screen(
                            queueId: widget.queueUserObj.queue_fk,
                          )
                        : QueueStats_queue_info_card(
                            modelObj: widget.queueObj,
                          ),
                  )
                ],
              ),
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Queue Statistics',
        style: TextStyle(
          color: Colors.black,
          // fontWeight: FontWeight.bold
          fontSize: 15,
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: () {
      //           // Navigator.pushNamed(context, '/Home');
      //         },
      //         icon: Icon(
      //           Icons.settings,
      //           color: Colors.black,
      //         )),
      //   )
      //   // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: () {
      //         onRefreshFunc()
      //       },
      //       icon: Icon(
      //         Icons.refresh,
      //         color: Colors.black,
      //       )),
      // )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<QueueUserFetchBloc>(context)
        .add(QueueUser_Fetch_onRefresh_Event());
    BlocProvider.of<QueueUserFetchBloc>(context)
        .add(QueueUser_Fetch_onInit_Event(widget.queue_Id));
    scrollController.addListener(scrollListener);
  }

  getMyUser() async {
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    UserAcc? myUser = await userAcc_sp_repo.spGet_UserAccObj();
    setState(() {
      store_userId = myUser?.id;
    });
  }
}
