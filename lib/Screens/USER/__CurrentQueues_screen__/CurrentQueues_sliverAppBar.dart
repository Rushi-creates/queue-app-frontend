import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Global_blocProviders/Cache_provider/cache_provider_bloc.dart';
import '../../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import 'UserHomeSearchBar.dart';

class CurrentQueues_sliverAppBar extends StatefulWidget {
  const CurrentQueues_sliverAppBar({super.key});

  @override
  State<CurrentQueues_sliverAppBar> createState() =>
      _CurrentQueues_sliverAppBarState();
}

class _CurrentQueues_sliverAppBarState
    extends State<CurrentQueues_sliverAppBar> {
  void initState() {
    super.initState();
    BlocProvider.of<CacheProviderBloc>(context)
        .add(Cache_userAccObj_Get_Event());
  }

  @override
  Widget build(BuildContext context) {
    return mySliverHeader(context);
  }

  mySliverHeader(context) {
    var dimVar = MediaQuery.of(context).size;

    return SliverAppBar(
      elevation: 5,
      automaticallyImplyLeading: false,
      collapsedHeight: dimVar.height * 0.08,
      expandedHeight: dimVar.height * 0.23,
      title: UserHomeSearchBar(),
      centerTitle: false,
      backgroundColor: Colors.grey[200],
      pinned: true,
      flexibleSpace: flexedUi(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
    );
    // return SliverPersistentHeader(delegate : ) ;
  }

  flexedUi() {
    return FlexibleSpaceBar(

        // centerTitle: true,

        // expandedTitleScale: 1.1,
        // title: UserHomeSearchBar(),
        // titlePadding: const EdgeInsets.fromLTRB(5.0, 1, 5.0, 1),
        background: Container(
      decoration: flexed_bg_ui(),
      // color: Colors.deepPurpleAccent.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SizedBox(
              //   height: dimVar.height * 0.105,
              // ),
              Text(
                "Welcome !",
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 23.0,
                ),
              ),
              // Text(
              //   "rushipatil1056789@gmail.com",
              //   // maxLines: 2,
              //   // overflow: TextOverflow.ellipsis,
              //   // textAlign: TextAlign.center,
              //   style: TextStyle(color: Colors.white
              //       // decoration: TextDecoration.none,
              //       // fontStyle: FontStyle.italic,
              //       // fontFamily: "FontNameHere" ,
              //       // fontWeight: FontWeight.bold,
              //       // fontWeight: FontWeight.w300,
              //       // fontSize: 20.0,
              //       ),
              // ),
              sp_userAccObj_BlocProvider_STATES()
            ],
          ),

          // child: ,
        ),
      ),
    ));
  }

  flexed_bg_ui() {
    return BoxDecoration(
      // borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(10.0),
      //     bottomRight: Radius.circular(10.0)),
      // color: Colors.black.withOpacity(0.5),
      image: new DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/joinedQueues.jpg'),
          colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 3, 8, 31).withOpacity(0.87),
              BlendMode.srcOver)),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //@ Sp states                               */
/* -------------------------------------------------------------------------- */
  sp_userAccObj_BlocProvider_STATES() {
    return BlocBuilder<CacheProviderBloc, CacheProviderState>(
      builder: (context, state) {
        if (state is cache_userAccObj_Got_State) {
          return Text(
            '${state.cache_userAccObj.email}',
            style: TextStyle(color: Colors.white),
          );
        }
        return Text(' inital ');
      },
    );
  }
}
