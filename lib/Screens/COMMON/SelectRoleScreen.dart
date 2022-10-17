import 'package:flutter/material.dart';
import 'package:no_queue2/Screens/SUPERADMIN/SuperAdminLogin.dart';
import 'package:no_queue2/Screens/USER_AUTH/__UserOtpScreen__/UserSwitchScreen.dart';

import '../ADMIN_AUTH/__AdminOtpScreen__/AdminSwitchScreen.dart';

//to change class name = right click on className> Rename symbol
class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  _SelectRoleScreenState createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: newBody(),
      // floatingActionButton: myFab(),
      appBar: MyAppBar(),
    );
  }

  newBody() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // selectOneText(),
      userSection(),
      customDivider(),
      adminSection(),
    ]);
  }

  selectOneText() {
    return Text(
      "Select one",
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
    );
  }

  customDivider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        35,
        15,
        35,
        15,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Divider(
            // thickness: 2,
            color: Colors.black,
          ),
          Center(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black,
              child: Text(
                'OR',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  userSection() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return UserSwitchScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                children: [
                  Image.asset("images/isUser.jpg",
                      // height: 200,
                      width: dimVar.width),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Are you a user? \nDo you wish to join any queue. Click here",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.teal[900],
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  adminSection() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdminSwitchScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                children: [
                  Image.asset("images/isAdmin.jpg",
                      // height: 200,
                      width: dimVar.width),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Are you a shop owner? \nStart creating your digital presence. Click here.",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue[900],
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        // fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  myFab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
      // tooltip: "Hint text on hover ",
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return SuperAdminLoginScreen();
        }));
      },
    );
  }

  MyAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.2,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //   ),
      //   onPressed: () => null,
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Select one', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.teal,
            child: FittedBox(
              child: IconButton(
                  icon: Icon(
                    Icons.admin_panel_settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SuperAdminLoginScreen();
                    }));
                  }),
            ),
          ),
        )
      ],
    );
  }

  // myBody() {
  //   return Center(
  //     child: Card(
  //       elevation: 6,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           TextButton(
  //             child: Text(
  //               "Are you a user?\nLogin as a user",
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
  //             onPressed: () {
  //               Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                 return UserSwitchScreen();
  //               }));
  //             },
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           TextButton(
  //             child: Text(
  //               "Are you a Admin?\nLogin as a Admin",
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
  //             onPressed: () {
  //               Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                 return AdminSwitchScreen();
  //               }));
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

}
