//Todo: pass listName[i] , which represents a single object of json data , from previous class's FAB , while calling this class's constructor

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/ADMIN/__QueuesCud__/Queues_cud_logic/Queues_cud_bloc.dart';
import '../../Repository_layer/AdminAcc_repo.dart';
import '../../service_layer/models/AdminAcc.dart';
import '../../service_layer/models/Queues.dart';
import '../COMPONENTS/components.dart';

//to change class name = right click on className> Rename symbol
class Queues_cud_screen extends StatefulWidget {
  //! add a model className
  final Queues? singleObj;

  Queues_cud_screen({this.singleObj});
  Queues_cud_screen.named({required this.singleObj});

  @override
  _Queues_cud_screenState createState() => _Queues_cud_screenState();
}

class _Queues_cud_screenState extends State<Queues_cud_screen> {
  //* Declaration
  final _createFormKey = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                         //@ Controllers + initState                        */
/* -------------------------------------------------------------------------- */
  //* Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController setMaxPeople_Controller = TextEditingController();

//! Init state
  @override
  void initState() {
    super.initState();
    if (widget.singleObj == null) {
      //pass all the controllers here
      nameController.text;
      desController.text;
      setMaxPeople_Controller.text;
    } else {
      // assign controller to model props
      nameController.text = widget.singleObj!.name;
      desController.text = widget.singleObj!.description;
      setMaxPeople_Controller.text = widget.singleObj!.setMaxPeople.toString();
    }
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
    return BlocConsumer<QueuesCudBloc, QueuesCudState>(
      listener: (context, state) {
        //# error states
        if (state is Queues_update_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        } else if (state is Queues_create_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        } else if (state is Queues_Delete_Error_State) {
          showErrorSnackbar(context, state.error);
          Navigator.pop(context);
        } else if (state is Queues_CantCreateMorethan5queue_State) {
          showErrorSnackbar(
              context, "Can't create more than 5 queues per shop");
          Navigator.pop(context);
        }
        //# loaded state
        else if (state is Queues_create_Loaded_State ||
            state is Queues_update_Loaded_State ||
            state is Queues_Delete_Loaded_state) {
          showSuccessSnackbar(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is Queues_create_Loading_State ||
            state is Queues_update_Loading_State ||
            state is Queues_Delete_Loading_state) {
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
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _createFormKey,
            child: Column(
              children: [
                // we can also use this custom func from reusable widgets file, to create a single textField , instead of using building whole new
                buildTextField(nameController, 'Enter name'),
                buildTextField(desController, 'Enter description'),
                buildTextField(setMaxPeople_Controller, 'Number of people'),

                //********form button here ******
                TextButton(
                    child: Text(
                      widget.singleObj == null ? "Save" : "Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () async {
                      if (_createFormKey.currentState!.validate()) {
                        if (widget.singleObj == null) {
                          AdminAcc_sp_repo adminAcc_sp_repo =
                              AdminAcc_sp_repo();
                          //!  get SP : admin id from sp
                          AdminAcc adminObj =
                              await adminAcc_sp_repo.spGet_AdminAccObj()!;
                          int storeId = adminObj.id!;

                          //# make model obj here to add
                          Queues modelObjToAdd = Queues(
                              name: nameController.text,
                              description: desController.text,
                              setMaxPeople:
                                  int.tryParse(setMaxPeople_Controller.text)!,
                              isOpen: true,
                              adminAcc_fk: storeId);
                          BlocProvider.of<QueuesCudBloc>(context).add(
                              Queues_create_onButtonPressed_Event(
                                  modelObjToAdd));
                        } else {
                          //@ create diff obj to update ( with id )or else , to much error
                          Queues modelObjToUpdate = Queues(
                            id: widget.singleObj!.id,
                            name: nameController.text,
                            description: desController.text,
                            setMaxPeople:
                                int.tryParse(setMaxPeople_Controller.text)!,
                            isOpen: true,
                            adminAcc_fk: widget.singleObj!.adminAcc_fk,
                          );

                          BlocProvider.of<QueuesCudBloc>(context).add(
                              Queues_Update_onButtonPressed_Event(
                                  modelObjToUpdate, widget.singleObj!.id));
                        }
                      }
                    })
              ],
            ),
          ),
        ),
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
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        widget.singleObj != null ? "Update" : "Create", //give here appBar title
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
                  onPressed: () {
                    //# Delete bloc, ( pass widget.single.id as ID )
                    BlocProvider.of<QueuesCudBloc>(context).add(
                        Queues_Delete_onButtonPressed_Event(
                            widget.singleObj!.id));
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

  showErrorSnackbar(context, error) {
    //Make sure this is a part of scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Some error!, couldn't complete action \n Error: $error"),
      ),
    );
  }

  showSuccessSnackbar(context) {
    //Make sure this is a part of scaffold
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Action completed"),
      ),
    );
  }
}
