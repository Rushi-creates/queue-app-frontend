import 'package:flutter/material.dart';
import 'package:no_queue2/Screens/ADMIN/__AdminHomeScreen__/Shop_info_card.dart';

class AdminHome_sliverAppBar extends StatelessWidget {
  final fromDiffProfile;
  const AdminHome_sliverAppBar({super.key, required this.fromDiffProfile});

  @override
  Widget build(BuildContext context) {
    return mySliverHeader(context);
  }

  mySliverHeader(context) {
    var dimVar = MediaQuery.of(context).size;

    return SliverAppBar(
      // elevation: 5,
      automaticallyImplyLeading: false,
      collapsedHeight: dimVar.height * 0.08,
      expandedHeight: dimVar.height * 0.27,
      // title: UserHomeSearchBar(),
      centerTitle: false,
      backgroundColor: Colors.white,
      pinned: true,
      flexibleSpace: flexedUi(),
    );
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
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                ' About shop:',
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
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10),
              ShopInfo_card(
                fromDiffProfile: fromDiffProfile,
              ),
            ],
          ),

          // child: ,
        ),
      ),
    ));
  }

  flexed_bg_ui() {
    return BoxDecoration(
      // color: Colors.black.withOpacity(0.5),
      image: new DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/joinedQueues.jpg'),
          colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 0, 17, 16).withOpacity(0.87),
              BlendMode.srcOver)),
    );
  }
}
