import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__Search_shop_screen__/SearchAdmin_fetch_fetchList/SearchAdmin_fetch_listTile_widget.dart';

import '../../../../Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';

class SearchAdmin_fetch_list_widget extends StatelessWidget {
  const SearchAdmin_fetch_list_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  fetchListStates() {
    return BlocBuilder<SearchAdminFetchBloc, SearchAdminFetchState>(
      builder: (context, state) {
        if (state is SearchAdmin_Fetch_Loaded_State) {
          return buildFetchList(state.modelObjList, context);
        } else if (state is SearchAdmin_Fetch_More_Loaded_ButEmpty_State) {
          return buildFetchList(state.prevList, context);
        } else if (state is SearchAdmin_Fetch_Loading_State) {
          return buildFetchList(state.prevList, context);
        } else if (state is SearchAdmin_Fetch_Error_State) {
          return buildFetchList(state.prevList, context);
        }

        print('default states');
        return buildFetchList([], context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                 //! if loaded then build fetchList                         */
/* -------------------------------------------------------------------------- */

  buildFetchList(List listArg, context) {
    return listArg.isEmpty
        ? showFetchListEmptyMsg(context)
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: listArg.length,
              itemBuilder: (context, i) {
                return listArg.isEmpty
                    ? showFetchListEmptyMsg(context)
                    : SearchAdmin_fetch_listTile_widget(
                        singleObj: listArg[i],
                      );
              },
            ),
          );
  }

  showFetchListEmptyMsg(context) {
    var dimVar = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset("images/noResults.jpg",
                height: 250, width: dimVar.width * 0.9),
            Text(
              'No Data',
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
          ],
        ),
      ),
    );
  }
}
