import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/COMPONENTS/components.dart';

import '../../../Logic/ADMIN_AUTH/__AdminLogin__/AdminLoginButton_logic/admin_login_button_bloc.dart';
import '../../../service_layer/models/AdminAcc.dart';
import '../../COMMON/SplashScreen.dart';

//to change class name = right click on className> Rename symbol
class AdminLoginForm extends StatefulWidget {
  const AdminLoginForm({Key? key}) : super(key: key);

  @override
  _AdminLoginFormState createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  //

  final _createFormKey = GlobalKey<FormState>();
  TextEditingController login_emailController = TextEditingController();
  TextEditingController login_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myLoginForm();
  }

  myLoginForm() {
    // var dimVar = MediaQuery.of(context).size;
    return // get parent height
        Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      child: Container(
        width: double.infinity,
        // height: double.infinity,
        margin: const EdgeInsets.all(0.0),
        color: Colors.red,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _createFormKey,
              child: Column(
                children: [
                  emailTextField(login_emailController, 'Enter email'),
                  SizedBox(height: 15),
                  passTextField(login_passwordController, 'Enter password'),
                  SizedBox(height: 15),
                  loginErrorText_STATES(),
                  myLoginButton_STATES(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                              //! Body widgets                              */
/* -------------------------------------------------------------------------- */

  loginButtonDesgin() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () async => loginFunctionality(),
      child: Container(
        decoration: BoxDecoration(color: Colors.pink),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */

  emailTextField(controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email connot be empty'; //if empty give error msg here
        } else if (!value.contains('@'))
          return 'Email should contain @';
        else if (!value.contains('.com')) return 'Email should contain .com';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  passTextField(controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty'; //if empty give error msg here
        } else if (value.length < 4) return 'Password too short';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  buildBorderedTextField(controllerArg, String labelTextArg,
      {bool isKbNumber = false, bool isObscure = false}) {
    var dimVar = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //******First text Field from here *****
          SizedBox(
            width: dimVar.width * 0.7,
            child: TextFormField(
              controller: controllerArg,
              obscureText: isObscure ? true : false,
              // onChanged: (value) {
              //   BlocProvider.of<AdminAuthBloc>(context)
              //       .add(Validate_Email_Event(emailController.text));
              //   BlocProvider.of<AdminAuthBloc>(context)
              //       .add(Validate_Number_Event(numberController.text));
              //   BlocProvider.of<AdminAuthBloc>(context)
              //       .add(Validate_password_Event(passwordController.text));
              // },
              keyboardType:
                  isKbNumber ? TextInputType.number : TextInputType.multiline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field required'; //if empty give error msg here
                }

                //? doesnt work for some reason
                // if (isCredentialWrong) {
                //   print('credtentials are wrong , from validation ');
                //   return 'Either email or password or both are wrong';
                // }
                // if (isAccExists) {
                //   print(
                //       'account already exists , try logging in instead , from validation ');
                //   return 'Account\'s email already exists, try logging in instead';
                // }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelTextArg, //hint text here
              ),
            ),
          ),
          SizedBox(
            height: 20,
            //height : dimVar.height*0.04
          ),
        ],
      ),
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
/*                                //@ My States                               */
/* -------------------------------------------------------------------------- */

  loginErrorText_STATES() {
    return BlocConsumer<AdminLoginButtonBloc, AdminLoginButtonState>(
      listener: (context, state) {
        if (state is AdminLoginSuccessState) {
          pushReplaceToSplash();
          MyScreenComponents.mySnackBar(
              context: context,
              textArg: 'Logged in successfully',
              isFloating: true);
        }
      },
      builder: (context, state) {
        if (state is AdminLoginLoadingState)
          return buildWarnTextDeisgn('');
        else if (state is AdminLogin_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is AdminLoginFailure_accountDontExist_State)
          return buildWarnTextDeisgn(state.msg);
        else if (state is AdminLoginSuccessState)
          return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myLoginButton_STATES() {
    return BlocBuilder<AdminLoginButtonBloc, AdminLoginButtonState>(
      builder: (context, state) {
        if (state is AdminLoginLoadingState) return buildLoading();
        // else if (state is AdminOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is AdminOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is AdminOtp_SuccessState) return buildWarnTextDeisgn('');
        return loginButtonDesgin();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */
  loginFunctionality() async {
    if (_createFormKey.currentState!.validate()) {
      AdminAcc adminObj = AdminAcc(
          email: login_emailController.text,
          password: login_passwordController.text);

      BlocProvider.of<AdminLoginButtonBloc>(context)
          .add(AdminLoginButton_Clicked_Event(adminObj));
    }
  }
}
