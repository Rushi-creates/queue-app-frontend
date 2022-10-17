import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Logic/ADMIN/__QueuesFetch__/Queues_fetch_logic/Queues_fetch_bloc.dart';
import 'Queues_fetch_listTile_widget.dart';

class Queues_fetch_list_widget extends StatelessWidget {
  final fromDiffProfile;
  const Queues_fetch_list_widget({
    super.key,
    required this.fromDiffProfile,
  });

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

/* -------------------------------------------------------------------------- */
/*                             //@  States                                    */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocConsumer<QueuesFetchBloc, QueuesFetchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Queues_Fetch_Loaded_State) {
          return gridBuildFetchList(state.modelObjList);
        } else if (state is Queues_Fetch_More_Loaded_ButEmpty_State) {
          return gridBuildFetchList(state.prevList);
        } else if (state is Queues_Fetch_Loading_State) {
          return gridBuildFetchList(state.prevList);
        }
        //  else if (state is Queues_Fetch_LoadingTimeOut_State) {
        //   return gridBuildFetchList(state.prevList);
        // }
        else if (state is Queues_Fetch_Error_State) {
          return gridBuildFetchList(state.prevList);
        }

        print('default states');
        return gridBuildFetchList([]);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                               //@ fetch list                               */
/* -------------------------------------------------------------------------- */

  gridBuildFetchList(List listArg) {
    return listArg.isEmpty
        ? showFetchListEmptyMsg()
        : Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 130,
                ),
                itemCount: listArg.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  return listArg.isEmpty
                      ? showFetchListEmptyMsg()
                      : Queues_fetch_listTile_widget(
                          fromDiffProfile: fromDiffProfile,
                          singleObj: listArg[i],
                        );
                }),
          );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ static widgets                             */
/* -------------------------------------------------------------------------- */

  showFetchListEmptyMsg() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'There are no queues active in this shop',
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
