import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/COMMON/SplashScreen.dart';
import 'package:no_queue2/Screens/ADMIN_AUTH/AdminRegButtonScreen.dart';

import '../../../Logic/ADMIN_AUTH/__AdminOtp__/AdminOtpButton_logic/admin_otp_button_bloc.dart';
import '../../../service_layer/models/AdminAcc.dart';

//to change class name = right click on className> Rename symbol
class AdminOtpForm extends StatefulWidget {
  const AdminOtpForm({Key? key}) : super(key: key);

  @override
  _AdminOtpFormState createState() => _AdminOtpFormState();
}

class _AdminOtpFormState extends State<AdminOtpForm> {
  //

  /*
    int? id;
  String email;
  int? number;
  String password;
  String? companyName;
  String? proofOfBiz_link;
  String? category;
  String? loc_firstLine;
  String? loc_secondLine;
  int? loc_pincode;
  bool? isAgreementAccpeted;
  bool? isAdminVerified;

  */

  final _createFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyName_controller = TextEditingController();
  TextEditingController proofOfBiz_link_controller = TextEditingController();
  TextEditingController category_controller = TextEditingController();
  TextEditingController loc_firstLine_controller = TextEditingController();
  TextEditingController loc_secondLine_controller = TextEditingController();
  TextEditingController loc_pincode_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myAdminOtpForm();
  }

  myAdminOtpForm() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()
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
                  emailTextField(),
                  SizedBox(height: 20),
                  numTextField(),
                  SizedBox(height: 20),

                  passTextField(),
                  SizedBox(height: 20),

                  companyNameTextField(),
                  SizedBox(height: 20),

                  proofBizTextField(),
                  SizedBox(height: 20),

                  category_TextField(),
                  SizedBox(height: 20),

                  firstAddress_TextField(),
                  SizedBox(height: 20),

                  secondAddress_TextField(),
                  SizedBox(height: 20),

                  pincode_TextField(),
                  SizedBox(height: 20),

                  // buildBorderedTextField(emailController, 'Enter email'),
                  // buildBorderedTextField(numberController, 'Enter number',
                  //     isKbNumber: true),
                  // buildBorderedTextField(passwordController, 'Enter password'),
                  // buildBorderedTextField(
                  //     companyName_controller, 'Enter company name'),
                  // buildBorderedTextField(proofOfBiz_link_controller,
                  //     'Enter proof of business link'),
                  // buildBorderedTextField(category_controller, 'Enter Category'),
                  // buildBorderedTextField(
                  //     loc_firstLine_controller, 'Enter first address line'),
                  // buildBorderedTextField(
                  //     loc_secondLine_controller, 'Enter second address line'),
                  // buildBorderedTextField(
                  //     loc_pincode_controller, 'Enter pincode',
                  //     isKbNumber: true),

                  //
                  otpErrorText_STATES(),
                  myOtpButton_STATES(),
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

  myOtpButtonDesign() {
    var dimVar = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () async => myOtpButton_func(),
      // onPressed: () async => FAKE_myOtpButton_func(),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.0, color: Colors.pink)),
        width: dimVar.width * 0.7,
        height: dimVar.height * 0.05,
        child: Center(
          child: Text(
            'Send OTP',
            style: TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                               //! TextFields                               */
/* -------------------------------------------------------------------------- */

  emailTextField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter email', //hint text here
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

  passTextField() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter password', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty'; //if empty give error msg here
        } else if (value.length < 4)
          return 'Password too short';
        else if (value.length > 19) return 'Password too long';
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

  numTextField() {
    return TextFormField(
      controller: numberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter number', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Number cannot be empty'; //if empty give error msg here
        } else if (value.length < 10)
          return 'Length of number must be 10';
        else if (value.length > 10)
          return 'Number cannot be more than 10 digits';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  companyNameTextField() {
    return TextFormField(
      controller: companyName_controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter company name', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty)
          return 'Company name connot be empty';
        else if (value.length < 2)
          return 'Name is too short';
        else if (value.length > 25) return 'Name is too long';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  proofBizTextField() {
    return TextFormField(
      controller: proofOfBiz_link_controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter proof of business link', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email connot be empty'; //if empty give error msg here
        } else if (value.length > 495) return 'Link too long';

        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  category_TextField() {
    return TextFormField(
      controller: category_controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter category', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Category connot be empty'; //if empty give error msg here
        } else if (value.length > 25) return 'Category name is too long';

        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  firstAddress_TextField() {
    return TextFormField(
      controller: loc_firstLine_controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter first address line', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Address connot be empty'; //if empty give error msg here
        } else if (value.length > 60) return 'Address is too long';

        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  secondAddress_TextField() {
    return TextFormField(
      controller: loc_secondLine_controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter second address line', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Address connot be empty'; //if empty give error msg here
        } else if (value.length > 60) return 'Address is too long';

        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

  pincode_TextField() {
    return TextFormField(
      controller: loc_pincode_controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter number', //hint text here
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Pincode cannot be empty'; //if empty give error msg here
        } else if (value.length < 6)
          return 'Length of number must be 6';
        else if (value.length > 6) return 'Number cannot be more than 6 digits';
        return null;
      },
      onChanged: (value) {
        _createFormKey.currentState!.validate();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Static widgets                             */
/* -------------------------------------------------------------------------- */

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

/* -------------------------------------------------------------------------- */
/*                                //@ My States                               */
/* -------------------------------------------------------------------------- */

  otpErrorText_STATES() {
    return BlocConsumer<AdminOtpButtonBloc, AdminOtpButtonState>(
      listener: (context, state) {
        if (state is AdminOtp_SuccessState) {
          pushToRegButtonScreen(state.otp);
        }
      },
      builder: (context, state) {
        if (state is AdminOtp_LoadingState)
          return buildWarnTextDeisgn('');
        else if (state is AdminOtp_UnknownError_State)
          return buildWarnTextDeisgn(state.error);
        else if (state is AdminOtp_accountAlreadyExists_State)
          return buildWarnTextDeisgn(state.msg);
        else if (state is AdminOtp_SuccessState) return buildWarnTextDeisgn('');
        return buildWarnTextDeisgn('');
      },
    );
  }

  myOtpButton_STATES() {
    return BlocBuilder<AdminOtpButtonBloc, AdminOtpButtonState>(
      builder: (context, state) {
        if (state is AdminOtp_LoadingState) return buildLoading();
        // else if (state is AdminOtp_UnknownError_State)
        //   return myOtpButtonDesign();
        // else if (state is AdminOtp_accountAlreadyExists_State)
        //   return buildWarnTextDeisgn(state.msg);
        // else if (state is AdminOtp_SuccessState) return buildWarnTextDeisgn('');
        return myOtpButtonDesign();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ FUNCTIONALITIES                            */
/* -------------------------------------------------------------------------- */

  //! this is real func
  myOtpButton_func() {
    if (_createFormKey.currentState!.validate()) {
      AdminAcc adminObj = AdminAcc(
          email: emailController.text,
          number: int.tryParse(numberController.text)!,
          password: passwordController.text,
          companyName: companyName_controller.text,
          proofOfBiz_link: proofOfBiz_link_controller.text,
          category: category_controller.text,
          loc_firstLine: loc_firstLine_controller.text,
          loc_secondLine: loc_secondLine_controller.text,
          loc_pincode: int.tryParse(loc_pincode_controller.text)!,
          isAgreementAccpeted: true,
          isAdminVerified: false);

      BlocProvider.of<AdminOtpButtonBloc>(context)
          .add(AdminOtpButtonClicked_Event(adminObj));
    }
  }

  // this is fake , to avoid current use of otp
  FAKE_myOtpButton_func() {
    if (_createFormKey.currentState!.validate()) {
      AdminAcc adminObj = AdminAcc(
          email: emailController.text,
          number: int.tryParse(numberController.text)!,
          password: passwordController.text,
          companyName: companyName_controller.text,
          proofOfBiz_link: proofOfBiz_link_controller.text,
          category: category_controller.text,
          loc_firstLine: loc_firstLine_controller.text,
          loc_secondLine: loc_secondLine_controller.text,
          loc_pincode: int.tryParse(loc_pincode_controller.text)!,
          isAgreementAccpeted: true,
          isAdminVerified: false);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AdminRegButtonScreen.named(
          regModelObj: adminObj,
          otp: 1234,
        );
      }));
    }
  }

  pushReplaceToSplash() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SplashScreen();
    }));
  }

  pushToRegButtonScreen(otp) {
    AdminAcc adminObj = AdminAcc(
        email: emailController.text,
        number: int.tryParse(numberController.text)!,
        password: passwordController.text,
        companyName: companyName_controller.text,
        proofOfBiz_link: proofOfBiz_link_controller.text,
        category: category_controller.text,
        loc_firstLine: loc_firstLine_controller.text,
        loc_secondLine: loc_secondLine_controller.text,
        loc_pincode: int.tryParse(loc_pincode_controller.text)!,
        isAgreementAccpeted: true,
        isAdminVerified: false);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminRegButtonScreen.named(
        regModelObj: adminObj,
        otp: otp,
      );
    }));
  }
}
