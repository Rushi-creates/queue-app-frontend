import 'dart:convert';

import 'package:no_queue2/service_layer/models/UserAcc.dart';
import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/SharedPreferences_helper.dart';

class UserAcc_api_repo {
  //Todo : (IMP) All functions of this class must be await , or else wont work
  //Todo : make sure to include JsonList method in modelClass from snipit.io

/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*            //! Create: Verify email and send otp before register           */
/* -------------------------------------------------------------------------- */

  create_verifyUserEmail_SendOtp(modelObj) async {
    var rawData = await _provider.addApi(
        ApiLinks.userAcc_verify_userEmail_beforeRegister, modelObj);

    // rawData can either have  OTP 1234 ||  String 'Account already exists, try to login'
    return rawData;
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Login                                 */
/* -------------------------------------------------------------------------- */

  create_loginUser(modelObj) async {
    // rawData can have 2 values:
    var rawData = await _provider.addApi(ApiLinks.userAcc_login, modelObj);

    // String - "This account doesn't exist, enter correct details or try to register."
    if (rawData is String) {
      return rawData;

      // Single Json map of logged in user
    } else if (rawData is Map<String, dynamic> ||
        rawData is Map<String, List>) {
      UserAcc response = UserAcc.fromMap(rawData);
      return response;

      //Todo : do this func , in bloc ( use func , from below)
      // //Storing reponse (UserAcc obj) to SP
      // await CacheHelper.set('Current_UserAcc_obj', response);

      // return 1; //Bloc flag = logged in success
    }
    ;
  }

/* -------------------------------------------------------------------------- */
/*                         //! Check Otp and Register                         */
/* -------------------------------------------------------------------------- */

  //Todo: make sure to write otp check logic in bloc
  create_UserRegister(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.userAcc_register, modelObj);
    return UserAcc.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return MODEL_CLASS_NAME.fromJsonList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  // fetchProp(int counter) async {
  //   var rawData = await _provider.fetchJsonList_by_prop(
  //     fetchUrl: someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //     customSearch: );

  //   return MODE_CLASS_NAME.fromJsonList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(fetchUrl, modelObj_id);

  //   return MODEL_CLASS_NAME.fromJson(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // create(modelObj) async {
  //   var rawData = await _provider.addApi(addApiUrl, modelObj);
  //   return MODEL_CLASS_NAME.fromJson(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(updateApiUrl, modelObj, modelObj_id);
  //   return MODEL_CLASS_NAME.fromJson(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  // delete(modelObjArg_Id) async {
  //   var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
  //   return rawData; // as api returns string, not a map
  // }

  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  deleteUser_account(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.userAcc_delete, modelObjArg_Id);
    return rawData;
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class UserAcc_sp_repo {
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // await CacheHelper.get('UserAcc');
  // await CacheHelper.set('UserAcc');
  // await CacheHelper.remove('UserAcc');

  spStore_UserAccObj(value) async {
    return await CacheHelper.set('Current_UserAcc_obj', value);
  }

  spGet_UserAccObj() async {
    var jsonMap = await CacheHelper.getModel('Current_UserAcc_obj');

    if (jsonMap == null)
      return null;
    else
      return UserAcc.fromJson(jsonMap);
  }

  spRemove_UserAccObj() async {
    return await CacheHelper.remove('Current_UserAcc_obj');
  }
}
