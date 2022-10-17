import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__CurrentQueues_screen__/CurrentQueues_screen.dart';
import 'package:no_queue2/Screens/USER_AUTH/Settings_screen.dart';

import '../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import '../../Logic/USER/CustomNavBar_logic/custom_nav_bar_bloc.dart';
import '../../Repository_layer/UserAcc_repo.dart';
import '../../service_layer/models/UserAcc.dart';
import '__Search_shop_screen__/Search_shop_screen.dart';

//to change class name = right click on className> Rename symbol
class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
/* -------------------------------------------------------------------------- */
/*                      //@ Storing sp in Bloc providers                      */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    getUserAcc_name();
  }

  getUserAcc_name() async {
    //!  get SP : user name from sp
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    UserAcc userObj = await userAcc_sp_repo.spGet_UserAccObj();

    //Bloc
    BlocProvider.of<SpBlocProviderBloc>(context)
        .add(sp_userAccObj_Store_Event(userObj));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: myBody(),
    );
  }

  myBody() {
    // var dimVar_height = MediaQuery.of(context).size;

    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [whichTabStates(), customBottombarDesign()],
      ),
    );
  }

  customBottombarDesign() {
    var dimVar = MediaQuery.of(context).size;

//height : dimVar.height*0.5    //to access height
//width : dimVar.width*0.5       //acces width
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 1),
      child: SizedBox(
          height: dimVar.height * 0.07,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(20),
                //     topRight: Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  // Colors.deepPurple,
                  // Colors.deepPurpleAccent,
                  // Color.fromARGB(255, 0, 27, 68),
                  // Color.fromARGB(255, 8, 0, 124),

                  Color.fromARGB(255, 6, 1, 92),
                  Color.fromARGB(255, 0, 16, 39),
                ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: homeIconStates(),
                        onPressed: () {
                          BlocProvider.of<CustomNavBarBloc>(context)
                              .add(CustomNavbar_HomeCLicked_Event());
                        },
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 40,
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: profileIconStates(),
                        onPressed: () {
                          BlocProvider.of<CustomNavBarBloc>(context)
                              .add(CustomNavbar_SearchCLicked_Event());
                        },
                      ),
                    ),
                  ),
                ]),
          )),
    );
  }

  homeIconStates() {
    return BlocBuilder<CustomNavBarBloc, CustomNavBarState>(
        builder: (context, state) {
      if (state is CustomNaBar_openHome_State) {
        return Icon(
          Icons.home,
          color: Colors.white,
        );
      } else if (state is CustomNaBar_openSearch_State) {
        return Icon(
          Icons.home_outlined,
          color: Colors.white,
        );
      }
      return Icon(
        Icons.home,
        color: Colors.white,
      );
    });
  }

  profileIconStates() {
    return BlocBuilder<CustomNavBarBloc, CustomNavBarState>(
        builder: (context, state) {
      if (state is CustomNaBar_openHome_State) {
        return Icon(
          Icons.person_outline,
          color: Colors.white,
        );
      } else if (state is CustomNaBar_openSearch_State) {
        return Icon(
          Icons.person,
          color: Colors.white,
        );
      }
      return Icon(
        Icons.person,
        color: Colors.white,
      );
    });
  }

  whichTabStates() {
    return BlocBuilder<CustomNavBarBloc, CustomNavBarState>(
        builder: (context, state) {
      if (state is CustomNaBar_openHome_State) {
        return CurrentQueues_screen();
      } else if (state is CustomNaBar_openSearch_State) {
        return SettingScreen();
      }
      return CurrentQueues_screen();
    });
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Home', //give here appBar title
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

  //   customBottombarDesignWithCards() {
//     var dimVar = MediaQuery.of(context).size;

// //height : dimVar.height*0.5    //to access height
// //width : dimVar.width*0.5       //acces width
//     return SizedBox(
//         height: dimVar.height * 0.07,
//         child: Container(
//           color: Colors.deepPurple,
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       color: Colors.white,
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.home,
//                           color: Colors.deepPurple,
//                         ),
//                         onPressed: () {
//                           BlocProvider.of<CustomNavBarBloc>(context)
//                               .add(CustomNavbar_HomeCLicked_Event());
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 VerticalDivider(),

//                 // FittedBox(
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(8.0),
//                 //     child: Column(
//                 //       mainAxisAlignment: MainAxisAlignment.start,
//                 //       crossAxisAlignment: CrossAxisAlignment.center,
//                 //       children: [

//                 FittedBox(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       color: Colors.white,
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.search,
//                           color: Colors.deepPurple,
//                         ),
//                         onPressed: () {
//                           BlocProvider.of<CustomNavBarBloc>(context)
//                               .add(CustomNavbar_SearchCLicked_Event());
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Text(
//                 //   "Search",
//                 //   // maxLines: 2,
//                 //   // overflow: TextOverflow.ellipsis,
//                 //   // textAlign: TextAlign.center,
//                 //   style: TextStyle(
//                 //     color: Colors.black,
//                 //     // decoration: TextDecoration.none,
//                 //     // fontStyle: FontStyle.italic,
//                 //     // fontFamily: "FontNameHere" ,
//                 //     // fontWeight: FontWeight.bold,
//                 //     // fontWeight: FontWeight.w300,
//                 //     fontSize: 12.0,
//                 //   ),
//                 // ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ]),
//         ));
//   }

}
