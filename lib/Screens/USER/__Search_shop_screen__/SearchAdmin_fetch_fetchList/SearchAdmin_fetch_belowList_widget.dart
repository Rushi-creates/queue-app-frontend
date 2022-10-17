import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/COMPONENTS/myComponents.dart';

import '../../../../Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';

class SearchAdmin_fetch_belowList_widget extends StatelessWidget {
  final scrollController;
  final scrollListener;
  final searchAdminController;
  const SearchAdmin_fetch_belowList_widget({
    super.key,
    required this.scrollController,
    required this.scrollListener,
    required this.searchAdminController,
  });

  @override
  Widget build(BuildContext context) {
    return belowLastTileStates();
  }

/* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTileStates() {
    return BlocConsumer<SearchAdminFetchBloc, SearchAdminFetchState>(
      listener: (context, state) {
        /// listen

        if (state is SearchAdmin_Fetch_More_Loaded_ButEmpty_State) {
          //# stop scrollListener , once no more items to fetch  ( do not dispose)
          scrollController.removeListener(scrollListener);
        } else if (state is SearchAdmin_Fetch_Error_State) {
          MyComponents.errorSnackBar(context, 'Some Network error');
        }
      },

      /// build
      builder: (context, state) {
        if (state is SearchAdmin_Fetch_Loading_State) {
          return customLoadingWidget();
        } else if (state is SearchAdmin_Fetch_Error_State) {
          return connectionErrorText(
              context, state.error, searchAdminController);
        } else if (state is SearchAdmin_Fetch_More_Loaded_ButEmpty_State) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nothing more to load'),
          );
        }
        return Text('');

        //@ if you ever want to use button instead of scroll controller
        // loadMoreButton(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //# Static widgets                             */
/* -------------------------------------------------------------------------- */

  connectionErrorText(context, error, searchAdminController) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: TextStyle(color: Colors.red),
          ),
          tryAgainButton(context)
        ],
      ),
    );
  }

  tryAgainButton(context) {
    return TextButton(
      child: Text(
        "Try again",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<SearchAdminFetchBloc>(context)
            .add(SearchAdmin_Fetch_onInit_Event(searchAdminController.text));
      },
    );
  }

  customLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MyComponents.buildLoading(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  // loadMoreButton(context) {
  //   return TextButton(
  //     child: Text(
  //       "Load more ",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
  //     onPressed: () {
  //       BlocProvider.of<SearchAdminFetchBloc>(context).add(Fetch_Start_Event());
  //     },
  //   );
  // }
}
