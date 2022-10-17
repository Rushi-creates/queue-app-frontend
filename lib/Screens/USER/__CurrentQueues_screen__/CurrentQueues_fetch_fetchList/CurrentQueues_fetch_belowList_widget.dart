import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/COMPONENTS/myComponents.dart';

import '../../../../Logic/ADMIN/__QueueUserFetch__/CurrentQueues_fetch_logic/CurrentQueues_fetch_bloc.dart';

class CurrentQueues_fetch_belowList_widget extends StatelessWidget {
  final scrollController;
  final scrollListener;
  const CurrentQueues_fetch_belowList_widget({
    super.key,
    required this.scrollController,
    required this.scrollListener,
  });

  @override
  Widget build(BuildContext context) {
    return belowLastTileStates();
  }

  belowLastTileStates() {
    return BlocConsumer<CurrentQueuesFetchBloc, CurrentQueuesFetchState>(
      listener: (context, state) {
        if (state is CurrentQueues_Fetch_More_Loaded_ButEmpty_State) {
          //! stop scrollListener , once no more items to fetch  ( do not dispose)
          scrollController.removeListener(scrollListener);
        } else if (state is CurrentQueues_Fetch_Error_State) {
          // this is imp
          // scrollController.addListener(scrollListener);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CurrentQueues_Fetch_Loading_State) {
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
        } else if (state is CurrentQueues_Fetch_Error_State) {
          return connectionErrorText(context, state.error);
        } else if (state is CurrentQueues_Fetch_More_Loaded_ButEmpty_State) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nothing more to load'),
          );
        }
        return Text('');

        //# if you ever want to use button instead of scroll controller
        // return TextButton(
        //   child: Text(
        //     "Load more ",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
        //   onPressed: () {
        //     BlocProvider.of<CurrentQueuesFetchBloc>(context)
        //         .add(Fetch_Start_Event());
        //   },
        // );
      },
    );
  }
/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  connectionErrorText(context, error) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: TextStyle(color: Colors.red),
          ),
          TextButton(
            child: Text(
              "Try again",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
            onPressed: () {
              BlocProvider.of<CurrentQueuesFetchBloc>(context)
                  .add(CurrentQueues_Fetch_onInit_Event());
            },
          ),
        ],
      ),
    );
  }
}
