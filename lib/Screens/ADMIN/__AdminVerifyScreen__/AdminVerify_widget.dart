import 'package:no_queue2/Global_blocProviders/bloc/diff_profile_bloc.dart';
import 'package:no_queue2/Screens/ADMIN/__AdminHomeScreen__/Admin_home_screen.dart';
import 'package:no_queue2/Screens/ADMIN_AUTH/__AdminSettingsScreen__/Admin_Settings_screen.dart';
import 'package:no_queue2/Screens/COMPONENTS/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import '../../../Logic/ADMIN/__AdminHome__/AdminVerify_logic/admin_verify_bloc.dart';
import '../../../Repository_layer/AdminAcc_repo.dart';
import '../../../service_layer/models/AdminAcc.dart';

class AdminVerifyScreen extends StatefulWidget {
  const AdminVerifyScreen({Key? key}) : super(key: key);

  @override
  _AdminVerifyScreenState createState() => _AdminVerifyScreenState();
}

class _AdminVerifyScreenState extends State<AdminVerifyScreen> {
/* -------------------------------------------------------------------------- */
/*                      //@ Storing sp in Bloc providers                      */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    getAdminAcc_name();

    BlocProvider.of<DiffProfileBloc>(context).add(diffProfile_Get_Event());
  }

  getAdminAcc_name() async {
    //!  get SP : admin obj from sp
    AdminAcc_sp_repo adminAcc_sp_repo = AdminAcc_sp_repo();
    AdminAcc? adminObj = await adminAcc_sp_repo.spGet_AdminAccObj();

    //Bloc
    BlocProvider.of<SpBlocProviderBloc>(context)
        .add(sp_adminAccObj_Store_Event(adminObj));
  }

/* -------------------------------------------------------------------------- */
/*                                  //@ Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      // body: myBody_STATES(),

      // this is an event called inside builder,
      //since we cannot call bloc listener in initstate
      body: adminVerify_BuilderEVENT(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */

  adminNotVerifiedSnackBar() {
    MyScreenComponents.mySnackBar(
      context: context,
      textArg: "You have not yet verified by owner of this business,Please"
          " check again later ",
      isFloating: true,
    );
  }

  buildWaitingToBeVerifiedText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your request for becoming an admin is sent to Owner of this business'
              'Please come back later, as you have not yet verified \n'
              ' as an admin by owner of this business. \n'
              'You can sign out / Delete your account ( from settings ) , if you did not applied to be an admin',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "If you are signed out automatically "
              "next time you open app , then you are rejected by super Admin "
              "for being an admin , and your account is deleted. "
              "You can still use this app , by creating a new account as a 'User')",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }

  buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  build_nullWidget() {
    return Text('');
  }

  appbar_BackArrow_design() {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => appBar_backArrow_Func());
  }

  appBarAction_SettingsIcon_Design() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () => appBarAction_SettingsIcon_FUNC(),
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          )),
    );
  }

  errorText() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Error while making request, please check you internet connection'),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: appBarLeading_BackIcon_STATES(),

      // leading: IconButton(
      //     icon: Icon(
      //       Icons.qr_code,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return QR_codeBox();
      //       }));
      //     }),

      title: Text(
        'Shop Queues', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        appBarAction_SettingsIcon_STATES(),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return SamplePage();
        //         }));
        //       },
        //       icon: Icon(
        //         Icons.refresh,
        //         color: Colors.black,
        //       )),
        // )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                            //@ My STATES                                   */
/* -------------------------------------------------------------------------- */

  adminVerify_STATES() {
    print('called');
    return BlocConsumer<AdminVerifyBloc, AdminVerifyState>(
      listener: (context, state) {
        print(state.runtimeType);
        if (state is isAdmin_NOT_verified_state) {
          adminNotVerifiedSnackBar();
        }
      },
      builder: (context, state) {
        if (state is isAdmin_check_loading_State) {
          return buildLoading();
        } else if (state is isAdmin_check_Error_State) {
          return errorText();
        } else if (state is isAdmin_verified_State) {
          return returnAdminHomeScreen_States();
        } else if (state is isAdmin_NOT_verified_state) {
          return buildWaitingToBeVerifiedText();
        }
        return Center(child: Text('Please wait...'));
      },
    );
  }

  returnAdminHomeScreen_States() {
    return BlocBuilder<DiffProfileBloc, DiffProfileState>(
      builder: (context, state) {
        if (state is DiffProfile_Got_State) {
          //

          return state.diffProfile_Obj == null
              ? Admin_home_screen()
              : Admin_home_screen.fromDiffProfile(
                  fromDiffProfile: state.diffProfile_Obj);
        }
        return Admin_home_screen(); // when og admin panel
      },
    );
  }

  appBarLeading_BackIcon_STATES() {
    return BlocBuilder<DiffProfileBloc, DiffProfileState>(
      builder: (context, state) {
        if (state is DiffProfile_Got_State) {
          //

          return state.diffProfile_Obj == null
              ? build_nullWidget()
              : appbar_BackArrow_design();
        }
        return build_nullWidget(); // when og admin panel
      },
    );
  }

  appBarAction_SettingsIcon_STATES() {
    return BlocBuilder<DiffProfileBloc, DiffProfileState>(
      builder: (context, state) {
        if (state is DiffProfile_Got_State) {
          if (state.diffProfile_Obj == null) {
            return appBarAction_SettingsIcon_Design();
          } else {
            return build_nullWidget();
          }

          // return state.diffProfile_Obj == null
          //     ? appBarAction_SettingsIcon_Design()
          //     : build_nullWidget();
        }
        return appBarAction_SettingsIcon_Design(); // when og admin panel
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  adminVerify_BuilderEVENT() {
    return BlocBuilder<DiffProfileBloc, DiffProfileState>(
        //do not use listen , it executes late , thus creates issues
        //put listen code in builder itself
        builder: (context, state) {
      //

      if (state is DiffProfile_Got_State) {
        //if from diff prof visiting admin prof
        print('=====================================>${state.diffProfile_Obj}');

        if (state.diffProfile_Obj == null) {
          BlocProvider.of<AdminVerifyBloc>(context)
              .add(IsAdmin_verify_checkOnStartup_Event());
        } else {
          print('verifying admin from diff profile');
          BlocProvider.of<AdminVerifyBloc>(context).add(
              IsAdmin_verify_checkOnStartup_fromDiffProfile_Event(
                  state.diffProfile_Obj.id));
        }

        //
        return adminVerify_STATES();
      }

      //if from OG admin User

      BlocProvider.of<AdminVerifyBloc>(context)
          .add(IsAdmin_verify_checkOnStartup_Event());

      return adminVerify_STATES();
    });
  }

  appBarAction_SettingsIcon_FUNC() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminSettingScreen();
    }));
  }

  appBar_backArrow_Func() {
    // remove other visiting profile's id , from global bloc provider
    BlocProvider.of<DiffProfileBloc>(context).add(diffProfile_Remove_Event());

    // //to refresh the previous search lists
    //(dont this over here)
    // BlocProvider.of<SearchAdminFetchBloc>(context)
    //     .add(SearchAdmin_Fetch_onRefresh_Event());

    Navigator.pop(context);
  }
}
