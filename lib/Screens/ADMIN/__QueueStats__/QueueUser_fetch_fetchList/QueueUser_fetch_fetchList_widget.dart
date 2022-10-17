import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueUser_fetch_fetchList/QueueUser_leaderboard_widget.dart';

import '../../../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
import '../../../COMPONENTS/myComponents.dart';
import 'QueueUser_fetch_belowList_widget.dart';
import 'QueueUser_fetch_listTile_widget.dart';

class QueueUser_fetch_fetchList_widget extends StatelessWidget {
  final store_userId;
  final queue_Id;
  final scrollController;
  final scrollListener;
  final fromAdminShop;
  const QueueUser_fetch_fetchList_widget({
    required this.store_userId,
    super.key,
    required this.fromAdminShop,
    required this.scrollController,
    required this.scrollListener,
    required this.queue_Id,
  });

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<QueueUserFetchBloc, QueueUserFetchState>(
        builder: (context, state) {
      if (state is QueueUser_Fetch_Loaded_State) {
        return buildFetchList(context, state.modelObjList);
      } else if (state is QueueUser_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(context, state.prevList);
      } else if (state is QueueUser_Fetch_Loading_State) {
        return buildFetchList(context, state.prevList);
      } else if (state is QueueUser_Fetch_Error_State) {
        return buildFetchList(context, state.prevList);
      }

      return buildFetchList(context, []);
    });
  }

/* -------------------------------------------------------------------------- */
/*                 //! if loaded then build fetchList                         */
/* -------------------------------------------------------------------------- */

  buildFetchList(context, List listArg) {
    var dimVar = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QueueUser_leaderboard_widget(listArg: listArg),
        LiveDataHeadingText(),
        listArg.isEmpty
            ? MyComponents.showFetchListEmptyMsg()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: dimVar.height * 0.18,
                    // width: dimVar.width * 0.3,
                    child: ListView.builder(
                      //! note : make sure to pass controller in this list
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: listArg.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            QueueUser_fetch_listTile_widget(
                              fromAdminShop: fromAdminShop,
                              store_userId: store_userId,
                              listArg: listArg,
                              i: i,
                            ),

                            //! below fetch list
                            i == listArg.length - 1
                                ? QueueUser_fetch_belowList_widget(
                                    queue_id: queue_Id,
                                    scrollController: scrollController,
                                    scrollListener: scrollListener,
                                  )
                                : Container()
                          ],
                        );
                      },
                    )),
              ),
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  LiveDataHeadingText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(23, 23, 23, 5),
      child: Text(
        "Live Queue:",
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
