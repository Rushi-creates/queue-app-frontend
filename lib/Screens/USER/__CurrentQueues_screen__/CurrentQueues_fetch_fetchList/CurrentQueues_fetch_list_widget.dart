import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__CurrentQueues_screen__/CurrentQueues_fetch_fetchList/CurrentQueues_fetch_listTile_widget.dart';

import '../../../../Logic/ADMIN/__QueueUserFetch__/CurrentQueues_fetch_logic/CurrentQueues_fetch_bloc.dart';

class CurrentQueues_fetch_list_widget extends StatefulWidget {
  const CurrentQueues_fetch_list_widget({super.key});

  @override
  State<CurrentQueues_fetch_list_widget> createState() =>
      _CurrentQueues_fetch_list_widgetState();
}

class _CurrentQueues_fetch_list_widgetState
    extends State<CurrentQueues_fetch_list_widget> {
  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  fetchListStates() {
    return BlocConsumer<CurrentQueuesFetchBloc, CurrentQueuesFetchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CurrentQueues_Fetch_Loaded_State) {
          return buildGridFetchList(state.modelObjList);
        } else if (state is CurrentQueues_Fetch_More_Loaded_ButEmpty_State) {
          return buildGridFetchList(state.prevList);
        } else if (state is CurrentQueues_Fetch_Loading_State) {
          return buildGridFetchList(state.prevList);
        } else if (state is CurrentQueues_Fetch_Error_State) {
          return buildGridFetchList(state.prevList);
        }

        print('default states');
        return buildGridFetchList([]);
      },
    );
  }

  buildGridFetchList(List listArg) {
    return listArg.isEmpty
        ? showFetchListEmptyMsg()
        : Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 108,
                      // mainAxisExtent: 145,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: listArg.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return listArg.isEmpty
                          ? showFetchListEmptyMsg()
                          : CurrentQueues_fetch_listTile_widget(
                              singleObj: listArg[i]);
                    }),
              ),
            ),
          );
  }

/* -------------------------------------------------------------------------- */
  showFetchListEmptyMsg() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'No queues joined yet',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
