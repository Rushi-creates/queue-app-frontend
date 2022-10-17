import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/service_layer/models/SuperAdmin.dart';

import '../../Logic/SUPERADMIN/__SaAuth__/Sa_auth_logic/sa_auth_bloc.dart';
import '../COMMON/SplashScreen.dart';
import '../COMPONENTS/components.dart';

//to change class name = right click on className> Rename symbol
class SuperAdminLoginScreen extends StatefulWidget {
  const SuperAdminLoginScreen({Key? key}) : super(key: key);

  @override
  _SuperAdminLoginScreenState createState() => _SuperAdminLoginScreenState();
}

class _SuperAdminLoginScreenState extends State<SuperAdminLoginScreen> {
  final _createFormKey = GlobalKey<FormState>();
  TextEditingController superStringController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/robot_queue.jpg'),
          ),
          exitIfNotSa_text(),
          myForm(),
        ],
      ),
    ));
  }

/* -------------------------------------------------------------------------- */
/*                              //! Body widgets                              */
/* -------------------------------------------------------------------------- */

  myForm() {
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(
                    superStringController, 'Enter super string code'),
                saCheck_ErrorText_STATES(),
                sa_checkButton_STATES(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saCheckButton_Desgin() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () async => saCheckButton_Func(),
      child: Container(
        decoration: BoxDecoration(color: Colors.pink),
        width: dimVar.width,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Check code',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

  exitIfNotSa_text() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'NOTE : Please exit this screen \nif you are not owner of this app',
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 14.0,
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
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'SuperAdmin', //give here appBar title
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

  buildWarnTextDeisgn(String textArg) {
    return Text(
      textArg,
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        fontSize: 15.0,
      ),
    );
  }

  buildLoading() {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Please wait...'),
        ),
        CircularProgressIndicator(),
      ],
    ));
  }

  pushReplaceToSplash() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SplashScreen();
    }));
  }

/* -------------------------------------------------------------------------- */
/*                                //@ MY STATES                               */
/* -------------------------------------------------------------------------- */

  saCheck_ErrorText_STATES() {
    return BlocConsumer<SaAuthBloc, SaAuthState>(
      listener: (context, state) {
        if (state is SA_auth_SuperString_Matched_Success_State) {
          pushReplaceToSplash();
          MyScreenComponents.mySnackBar(
              context: context,
              textArg: 'Logged in successfully',
              isFloating: true);
        }
      },
      builder: (context, state) {
        if (state is SA_auth_LoadingState)
          return buildWarnTextDeisgn('');
        else if (state is SA_auth_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is SA_auth_SuperString_NOT_matched_State)
          return buildWarnTextDeisgn('Wrong code entered');
        else if (state is SA_auth_SuperString_Matched_Success_State)
          return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  sa_checkButton_STATES() {
    return BlocBuilder<SaAuthBloc, SaAuthState>(
      builder: (context, state) {
        if (state is SA_auth_LoadingState) return buildLoading();
        // else if (state is UserOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is UserOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is UserOtp_SuccessState) return buildWarnTextDeisgn('');
        return saCheckButton_Desgin();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUCNTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  saCheckButton_Func() {
    if (_createFormKey.currentState!.validate()) {
      SuperAdmin saObj = SuperAdmin(superString: superStringController.text);

      BlocProvider.of<SaAuthBloc>(context)
          .add(CheckSa_ButtonCLicked_Event(saObj));
    }
  }
}
