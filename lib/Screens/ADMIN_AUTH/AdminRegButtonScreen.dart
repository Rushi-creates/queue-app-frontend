import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/ADMIN_AUTH/__AdminReg__/AdminRegButton_logic/admin_reg_button_bloc.dart';
import '../COMMON/SplashScreen.dart';
import '../COMPONENTS/components.dart';

//to change class name = right click on className> Rename symbol
class AdminRegButtonScreen extends StatefulWidget {
/* -------------------------------------------------------------------------- */
/*                           //@ constructor fields                           */
/* -------------------------------------------------------------------------- */
  final regModelObj;
  final otp;

  const AdminRegButtonScreen({Key? key, this.regModelObj, this.otp})
      : super(key: key);

  const AdminRegButtonScreen.named(
      {super.key, required this.regModelObj, required this.otp});

  @override
  _AdminRegButtonScreenState createState() => _AdminRegButtonScreenState();
}

class _AdminRegButtonScreenState extends State<AdminRegButtonScreen> {
  final _createFormKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

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
      child: Center(
          child:
              Padding(padding: const EdgeInsets.all(15.0), child: myOtpForm())),
    );
  }

  myOtpForm() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _createFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              otpTextField(otpController, 'Enter the 4 digit otp here'),
              regErrorText_STATES(),
              Center(
                child: myRegButton_STATES(),
              ),
              SizedBox(height: 10),
              resendOtpButtonDesign()
            ],
          ),
        ),
      ),
    );
  }

  otpTextField(controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'OTP cannot be empty'; //if empty give error msg here
        } else if (value.length < 4)
          return 'Enter 4 digit otp';
        else if (value.length > 4) return 'Otp cannot be more than 4 digits';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
      // onChanged: (value) {
      //   BlocProvider.of<UserLoginFormBloc>(context)
      //       .add(UserLoginPass_Changed_Event(controller.text));
      // },
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! body widgets                              */
/* -------------------------------------------------------------------------- */
  registerButtonDesgin() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () async => registerFunctionality(),
      child: Container(
        decoration: BoxDecoration(color: Colors.pink),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Register',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

  resendOtpButtonDesign() {
    return TextButton(
      child: Text(
        "Go back and resend Otp",
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          // fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          // fontSize: 20.0,
        ),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.white),
      onPressed: () => resendOtpButton_Func(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */
  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Enter Otp', //give here appBar title
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
/*                                //@ My STATES                               */
/* -------------------------------------------------------------------------- */

  regErrorText_STATES() {
    return BlocConsumer<AdminRegButtonBloc, AdminRegButtonState>(
      listener: (context, state) {
        if (state is AdminRegisterSuccessState) {
          pushReplaceToSplash();
          MyScreenComponents.mySnackBar(
              context: context,
              textArg: 'Signed in successfully',
              isFloating: true);
        }
      },
      builder: (context, state) {
        if (state is AdminRegisterLoadingState)
          return buildWarnTextDeisgn('');
        else if (state is AdminRegister_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is OtpDidntMatched_State)
          return buildWarnTextDeisgn(
              'Wrong OTP entered, please enter correct OTP');
        else if (state is AdminRegisterSuccessState)
          return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myRegButton_STATES() {
    return BlocBuilder<AdminRegButtonBloc, AdminRegButtonState>(
      builder: (context, state) {
        if (state is AdminRegisterLoadingState) return buildLoading();
        // else if (state is AdminOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is AdminOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is AdminOtp_SuccessState) return buildWarnTextDeisgn('');
        return registerButtonDesgin();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  registerFunctionality() {
    if (_createFormKey.currentState!.validate()) {
      BlocProvider.of<AdminRegButtonBloc>(context).add(
          AdminRegButtonClicked_Event(
              modelObjToAdd: widget.regModelObj,
              otpFromPreviousPage: widget.otp,
              otpFromTextField: int.tryParse(otpController.text)));
    }
  }

  resendOtpButton_Func() {
    Navigator.pop(context);
  }
}
