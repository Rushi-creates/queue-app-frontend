import 'package:no_queue2/Logic/SUPERADMIN/__SuperAdminHome__/logout_sa_logic/logout_sa_bloc.dart';
import 'package:no_queue2/Screens/COMMON/SplashScreen.dart';
import 'package:no_queue2/service_layer/models/AdminAcc.dart';

import '../../Logic/SUPERADMIN/__SuperAdminHome__/Admin_ReqList_logic/admin_request_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//to change class name = right click on className> Rename symbol
class Sa_Home extends StatefulWidget {
  const Sa_Home({Key? key}) : super(key: key);

  @override
  _Sa_HomeState createState() => _Sa_HomeState();
}

class _Sa_HomeState extends State<Sa_Home> {
  final ScrollController scrollController = ScrollController();

  List myStoreList = [];

  @override
  void dispose() {
    scrollController.dispose();
    myStoreList.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);
    BlocProvider.of<AdminRequestListBloc>(context)
        .add(SA_Fetch_appliedAdminList_onStartup_Event());
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(Duration(milliseconds: 100), () {
        BlocProvider.of<AdminRequestListBloc>(context)
            .add(SA_FetchProp_More_onListEnd_Event());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                     //! Handling if role is superadmin                     */
/* -------------------------------------------------------------------------- */

  myBody() {
    return BlocConsumer<LogoutSaBloc, LogoutSaState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is Logout_SuperAdmin_Failure_State) {
          //Make sure this is a part of scaffold
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text("Error, can not sign out, try again later"),
            ),
          );
        }
        if (state is Logout_SuperAdmin_Success_State) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return SplashScreen();
          }));
        }
      },
      builder: (context, state) {
        if (state is Logout_SuperAdmin_Loading_State) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return statesFor_isAdminTrue_ButtonClicked();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                        //! is admin true fetch list                        */
/* -------------------------------------------------------------------------- */

  statesFor_isAdminTrue_ButtonClicked() {
    return BlocConsumer<AdminRequestListBloc, AdminRequestListState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SA_isAdminTrue_button_AcceptedOrRejected_Error_State) {
          //Make sure this is a part of scaffold
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                  "Oops! something , went wrong , could not complete request"),
            ),
          );
        } else if (state is SA_isAdminTrue_button_Accepted_State ||
            state is SA_isAdminTrue_button_Rejected_State) {
          BlocProvider.of<AdminRequestListBloc>(context)
              .add(SA_Fetch_appliedAdminList_onStartup_Event());
        }
      },
      builder: (context, state) {
        if (state is SA_isAdminTrue_button_AcceptedOrRejected_Loading_State) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state
            is SA_isAdminTrue_button_AcceptedOrRejected_Error_State) {
          return Center(
            child: Text(
                'Something went wrong , make sure you are connected to internet'),
          );
        }

        //  else if (state is SA_isAdminTrue_button_Accepted_State ||
        //     state is SA_isAdminTrue_button_Rejected_State) {
        //   return SingleChildScrollView(
        //     child: Column(children: [
        //       // buildSearchBar(),
        //       states_for_isAdminTrueList()
        //     ]),
        //   );
        // }
        return SingleChildScrollView(
          //! note : make sure to pass controller in this list
          controller: scrollController,
          child: Column(children: [
            // buildSearchBar(),
            myPagStates()
          ]),
        );
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                            //# pagination states                           */
/* -------------------------------------------------------------------------- */

  myPagStates() {
    return BlocConsumer<AdminRequestListBloc, AdminRequestListState>(
      listener: (context, state) {
        if (state is SA_isAdminTrue_FetchList_Error_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        } else if (state is SA_isAdminTrue_FetchProp_More_Loaded_State) {
          myStoreList.addAll(state.moreModelObjList);
        }
      },
      builder: (context, state) {
        if (state is SA_isAdminTrue_FetchList_Loading_State) {
          return buildLoading();
        } else if (state is SA_isAdminTrue_FetchList_Error_State) {
          return connectionErrorText(state.error);
        } else if (state is SA_isAdminTrue_FetchList_Loaded_State) {
          myStoreList = state.appliedAdminList;
          return buildFetchList(myStoreList);
        }
        //  else if (state is Xoo_FetchProp_Refreshed_State) {
        //   return buildFetchList(myStoreList);
        // }
        print('default widget');
        return buildFetchList(myStoreList);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //# Fetch List UI                             */
/* -------------------------------------------------------------------------- */

  buildFetchList(List listArg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: myStoreList.length,
            itemBuilder: (context, i) {
              return myStoreList.isEmpty
                  ? showFetchListEmptyMsg()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.amberAccent,
                        title: Text(listArg[i].email!),
                        subtitle: Text(listArg[i].password),
                        leading: buildAcceptAdminButton(listArg[i]),
                        trailing: buildRejectAdminButton(listArg[i]),
                      ),
                    );
            },
          ),

          //# to states to show at end of list
          BlocConsumer<AdminRequestListBloc, AdminRequestListState>(
            listener: (context, state) {
              if (state
                  is SA_isAdminTrue_FetchProp_More_Loaded_ButEmpty_State) {
                //! this is imp , as we need to stop listening to scroll controller
                //! once there are no more items in the list to fetch
                scrollController.dispose();
              }
            },
            builder: (context, state) {
              if (state
                  is SA_isAdminTrue_FetchProp_More_Loaded_ButEmpty_State) {
                return Text('Nothing more to load');
              } else if (state is SA_isAdminTrue_FetchProp_More_Loading_State) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 20),
                  child: CircularProgressIndicator(),
                );
              } else if (state is SA_isAdminTrue_FetchProp_More_Error_State) {
                return Text(
                    'Something went wrong, \n Please check your internet');
              }

              return Text('');

              /* -------------------------------------------------------------------------- */
              /*                //@ if we ever want to use, load more button,               */
              /* -------------------------------------------------------------------------- */
              // return TextButton(
              //   child: Text(
              //     "Load more ",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
              //   onPressed: () {
              //     BlocProvider.of<PaginationBloc>(context)
              //         .add(FetchNew_onListEnd_Event());
              //   },
              // );
            },
          ),
        ],
      ),
    );
    // },
    // );
  }

  connectionErrorText(error) {
    return Center(
      child: Text(
        'Connection error, Please check you internet, or \n '
        'Error: $error',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  showFetchListEmptyMsg() {
    return Center(
      child: Text(
        'No results found ',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  buildAcceptAdminButton(currentListTile) {
    AdminAcc adminAccObj = AdminAcc(
        email: currentListTile.email,
        number: currentListTile.number,
        password: currentListTile.password,
        companyName: currentListTile.companyName,
        proofOfBiz_link: currentListTile.proofOfBiz_link,
        category: currentListTile.category,
        loc_firstLine: currentListTile.loc_firstLine,
        loc_secondLine: currentListTile.loc_secondLine,
        loc_pincode: currentListTile.loc_pincode,
        isAgreementAccpeted: currentListTile.isAgreementAccpeted,
        isAdminVerified: true //! this is updated , imp

        );

    return IconButton(
      color: Colors.green,
      icon: Icon(Icons.add_task),
      onPressed: () {
        myStoreList.clear();
        BlocProvider.of<AdminRequestListBloc>(context).add(
            SA_isAdminTrue_Button_Accepted_Event(
                adminAccObj, currentListTile.id));
      },
    );
  }

  buildRejectAdminButton(currentListTile) {
    return IconButton(
      color: Colors.red,
      icon: Icon(Icons.remove_circle),
      onPressed: () {
        myStoreList.clear();

        BlocProvider.of<AdminRequestListBloc>(context)
            .add(SA_isAdminTrue_Button_Rejected_Event(currentListTile.id));
      },
    );
  }

  buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Super Admin Panel', //give here appBar title
        style: TextStyle(color: Colors.black),
      ),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.qr_code,
      //     color: Colors.black,
      //   ),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return QR_codeBox();
      //     }));
      //   },
      // ),
      actions: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: IconButton(
        //     icon: Icon(
        //       Icons.person,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return ViewAttendance();
        //       }));
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              BlocProvider.of<LogoutSaBloc>(context)
                  .add(Logout_forSuperAdmin_ButtonPressedEvent());
            },
          ),
        )
      ],
    );
  }

  // states_for_isAdminTrueList() {
  //   return BlocConsumer<AdminRequestListBloc, AdminRequestListState>(
  //     listener: (context, state) {
  //       // TODO: implement listener
  //       if (state is SA_isAdminTrue_FetchList_Error_State) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.red,
  //             content: Text('Some Network error'),
  //           ),
  //         );
  //       }
  //     },
  //     builder: (context, state) {
  //       if (state is SA_isAdminTrue_FetchList_Error_State) {
  //         return connectionErrorText();
  //       } else if (state is SA_isAdminTrue_FetchList_Loading_State) {
  //         return buildLoading();
  //       } else if (state is SA_isAdminTrue_FetchList_Loaded_State) {
  //         return buildFetchList(state.appliedAdminList);
  //       }
  //       return buildLoading();
  //     },
  //   );
  // }

  //   buildFetchList(List listArg) {
  //   print(listArg.length);
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       scrollDirection: Axis.vertical,
  //       itemCount: listArg.length,
  //       itemBuilder: (context, i) {
  //         // this isEmpty or ==0 , is not working for some reason, very strange
  //         return listArg.isEmpty
  //             ? showFetchListEmptyMsg()
  //             : Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: ListTile(
  //                   tileColor: Colors.amberAccent,
  //                   title: Text(listArg[i].email!),
  //                   subtitle: Text(listArg[i].password),
  //                   leading: buildAcceptAdminButton(listArg[i]),
  //                   trailing: buildRejectAdminButton(listArg[i]),
  //                 ),
  //               );
  //       },
  //     ),
  //   );
  // }

}
