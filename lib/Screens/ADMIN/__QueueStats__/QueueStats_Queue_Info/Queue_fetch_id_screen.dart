import 'package:no_queue2/Screens/ADMIN/__QueueStats__/QueueStats_Queue_Info/QueueStats_queue_info_Card.dart';

import '../../../../Logic/ADMIN/__QueueUserFetch__/Queue_fetch_id_logic/Queue_fetch_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class Queue_FetchId_Screen extends StatefulWidget {
  final queueId;
  const Queue_FetchId_Screen({Key? key, required this.queueId})
      : super(key: key);

  @override
  _Queue_FetchId_ScreenState createState() => _Queue_FetchId_ScreenState();
}

class _Queue_FetchId_ScreenState extends State<Queue_FetchId_Screen> {
  //# dummy id stored
  // int sp_id = 1;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QueueFetchIdBloc>(context)
        .add(Queue_FetchById_onButtonPressed_Event(widget.queueId));
  }

  @override
  Widget build(BuildContext context) {
    return states_for_fetchSingleById();
  }

  states_for_fetchSingleById() {
    return BlocConsumer<QueueFetchIdBloc, QueueFetchIdState>(
      listener: (context, state) {
        if (state is Queue_FetchById_Error_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Queue_FetchById_Error_State) {
          return connectionErrorText(state.error);
        } else if (state is Queue_FetchById_Loading_State) {
          return buildLoading();
        } else if (state is Queue_FetchById_Loaded_State) {
          return QueueStats_queue_info_card(modelObj: state.modelObj);
        }
        return buildLoading();
      },
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
