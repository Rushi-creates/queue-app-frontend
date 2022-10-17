//Todo: pass listName[i] , which represents a single object of json data , from previous class's FAB , while calling this class's constructor

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:no_queue2/Repository_layer/UserAcc_repo.dart';

import '../../Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
import '../../Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
import '../../service_layer/models/QueueUser.dart';
import '../../service_layer/models/UserAcc.dart';

//to change class name = right click on className> Rename symbol
class QueueUser_cud_screen extends StatefulWidget {
  //! add a model className
  final QueueUser? singleObj;
  final propOfQueue;
  final fromDiffProfile;

  QueueUser_cud_screen(
      {this.singleObj,
      required this.propOfQueue,
      required this.fromDiffProfile});
  QueueUser_cud_screen.named(
      {required this.singleObj, this.propOfQueue, this.fromDiffProfile});

  @override
  _QueueUser_cud_screenState createState() => _QueueUser_cud_screenState();
}

class _QueueUser_cud_screenState extends State<QueueUser_cud_screen> {
  //* Declaration
  final _createFormKey = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                         //@ Controllers + initState                        */
/* -------------------------------------------------------------------------- */
  // //* Controllers
  // TextEditingController firstController = TextEditingController();
  // create more controllers here , based on which modelClassProps we want to accept from user

//! Init state
  @override
  void initState() {
    super.initState();

    // if (widget.singleObj == null) {
    //   //pass all the controllers here
    //   firstController.text;
    //   desController.text;
    // } else {
    //   // assign controller to model props
    //   firstController.text = widget.singleObj!.propName;
    //   desController.text = widget.singleObj!.propName;
    // }
  }

/* -------------------------------------------------------------------------- */
/*                            //@  States                                     */
/* -------------------------------------------------------------------------- */
  //! Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [my_cud_states()],
          ),
        ));
  }

  my_cud_states() {
    return BlocConsumer<QueueUserCudBloc, QueueUserCudState>(
      listener: (context, state) {
        //# error states
        if (state is QueueUser_update_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        } else if (state is QueueUser_create_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        } else if (state is QueueUser_Delete_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        }
        //# loaded state
        else if (state is QueueUser_create_Loaded_State ||
            state is QueueUser_update_Loaded_State ||
            state is QueueUser_Delete_Loaded_state) {
          showSuccessSnackbar(context);
          //! reload on back ( sent true)
          Navigator.pop(context, true);
        } else if (state is QueueUser_Cant_create_already_exists_State) {
          print('already exists');
          showCantCreateSnackbar(context, state.msg);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is QueueUser_create_Loading_State ||
            state is QueueUser_update_Loading_State ||
            state is QueueUser_Delete_Loading_state) {
          return buildLoading();
        }
        return userForm(); //Todo : pass here first widget
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //@ Widgets here                              */
/* -------------------------------------------------------------------------- */

  userForm() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            height: dimVar.height * 0.2,
          ),
          Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _createFormKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        staticImage(),
                        staticFormText(),
                        SizedBox(
                          height: 40,
                        ),
                        formButtons()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  staticImage() {
    var dimVar = MediaQuery.of(context).size;
    return Image.asset("images/isUser.jpg",
        // height: 200,
        width: dimVar.width);
  }

  staticFormText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 1, 8.0, 1),
          child: Text(
            widget.singleObj == null ? "Stand in queue" : "Update number?",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal[900],
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 25.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            widget.singleObj == null
                ? "Do you wish to join this queue?"
                : "Do you wish to stand last in queue?",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  formButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.teal),
            ),
            onPressed: () async {
              Navigator.pop(context);
            }),

        //

        SizedBox(width: 15),
        //
        TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.teal),
            child: Text(
              widget.singleObj == null ? "Join Queue" : "Stand last",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              //User acc sp
              UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
              UserAcc myUser = await userAcc_sp_repo.spGet_UserAccObj();

              if (_createFormKey.currentState!.validate()) {
                if (widget.singleObj == null) {
                  QueueUser queueUserObj = QueueUser(
                      // queue_name: widget.propOfQueue.name,
                      // userAcc_name: myUser.email,
                      // adminAcc_name: widget.fromDiffProfile.email,
                      // adminAcc_name: widget.fromDiffProfile.companyName,
                      joinedTime:
                          '${DateFormat('hh:mm:ss a, EEE, d/M/y').format(DateTime.now())}',
                      queue_fk: widget.propOfQueue.id,
                      userAcc_fk: myUser.id!,
                      adminAcc_fk: widget.fromDiffProfile.id);

                  //
                  BlocProvider.of<QueueUserCudBloc>(context).add(
                      QueueUser_create_onButtonPressed_Event(queueUserObj));
                  print(queueUserObj);

                  //# refresh
                  BlocProvider.of<QueueUserFetchBloc>(context)
                      .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
                } else {
                  //@ create diff obj to update ( with id )or else , to much error
                  QueueUser modelObjToUpdate = await QueueUser(
                      // queue_name: widget.singleObj!.queue_name,
                      // userAcc_name: widget.singleObj!.userAcc_name,
                      // adminAcc_name: widget.singleObj!.adminAcc_name,
                      joinedTime:
                          '${DateFormat('hh:mm:ss a, EEE, d/M/y').format(DateTime.now())}',
                      queue_fk: widget.singleObj!.queue_fk,
                      userAcc_fk: widget.singleObj!.userAcc_fk,
                      adminAcc_fk: widget.singleObj!.adminAcc_fk);

                  print(modelObjToUpdate);

                  BlocProvider.of<QueueUserCudBloc>(context).add(
                      QueueUser_Update_onButtonPressed_Event(
                          modelObjToUpdate, widget.singleObj!.id));

                  //# refresh
                  BlocProvider.of<QueueUserFetchBloc>(context)
                      .add(QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
                }
              }
            })
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                            //@ Scaffold widgets                            */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          // make sure the id passed here , is right , as previous screen

          Navigator.pop(context);
          // make sure to make it a async , await onPressed()
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        widget.singleObj != null
            ? "Update reservation"
            : "Add reservation", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        //! Delete button
        widget.singleObj != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                child: TextButton(
                  child: Row(
                    children: [
                      Text(
                        "DELETE",
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red[300],
                      )
                    ],
                  ),
                  onPressed: () async {
                    //# Delete bloc, ( pass widget.single.id as ID )
                    BlocProvider.of<QueueUserCudBloc>(context).add(
                        QueueUser_Delete_onButtonPressed_Event(
                            widget.singleObj!.id));

                    //# refresh
                    BlocProvider.of<QueueUserFetchBloc>(context).add(
                        QueueUser_Fetch_onInit_Event(widget.propOfQueue.id));
                  },
                ),
              )
            : Text(''),
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static Widgets                             */
/* -------------------------------------------------------------------------- */

  buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  showCantCreateSnackbar(context, msg) {
    //Make sure this is a part of scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.amber,
        content: Text(
            'You are already standing in the queue, cant add again.\n$msg'),
      ),
    );
  }

  showErrorSnackbar(context, error) {
    //Make sure this is a part of scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text("Some error!, couldn't complete action \n Error: $error"),
      ),
    );
  }

  showSuccessSnackbar(context) {
    //Make sure this is a part of scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text("Action completed"),
      ),
    );
  }
}
