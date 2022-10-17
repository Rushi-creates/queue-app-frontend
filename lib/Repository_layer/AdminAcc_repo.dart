import 'package:no_queue2/service_layer/models/AdminAcc.dart';
import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/SharedPreferences_helper.dart';

class AdminAcc_api_repo {
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

  create_verifyAdminEmail_SendOtp(modelObj) async {
    var rawData = await _provider.addApi(
        ApiLinks.adminAcc_verify_adminEmail_beforeRegister, modelObj);

    // rawData can either have  OTP 1234 ||  String 'Account already exists, try to login'
    return rawData;
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Login                                 */
/* -------------------------------------------------------------------------- */

  create_loginAdmin(modelObj) async {
    // rawData can have 2 values:
    var rawData = await _provider.addApi(ApiLinks.adminAcc_login, modelObj);

    // String - "This account doesn't exist, enter correct details or try to register."
    if (rawData is String) {
      return rawData;

      // Single Json map of logged in admin
    } else if (rawData is Map<String, dynamic> ||
        rawData is Map<String, List>) {
      AdminAcc response = AdminAcc.fromMap(rawData);
      return response;

      //Todo : do this func , in bloc ( use func , from below)
      // //Storing reponse (AdminAcc obj) to SP
      // await CacheHelper.set('Current_AdminAcc_obj', response);

      // return 1; //Bloc flag = logged in success
    }
    ;
  }

/* -------------------------------------------------------------------------- */
/*                         //! Check Otp and Register                         */
/* -------------------------------------------------------------------------- */

  //Todo: make sure to write otp check logic in bloc
  create_AdminRegister(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.adminAcc_register, modelObj);
    return AdminAcc.fromMap(rawData);
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

  fetchProp_isAdminVerified_false(int counter) async {
    var rawData = await _provider.fetchJsonList_by_prop(
      fetchUrl: ApiLinks.adminAcc_getAll,
      pageSize: pageSizeVar,
      pageNum: counter,
      customSearch: "&isAdminVerified=false",
    );
    return AdminAcc.fromMapList(rawData);
  }

  fetchProp_isAdminVerifiedAndSearchByEmail(
      int counter, String emailController) async {
    // String regexSearch = '__icontains'; // doesnt work
    var rawData = await _provider.fetchJsonList_by_prop(
      fetchUrl: ApiLinks.adminAcc_getRegexSearch,
      pageSize: pageSizeVar,
      pageNum: counter,
      customSearch: "&isAdminVerified=true&email=$emailController",
    );
    return AdminAcc.fromMapList(rawData);
  }

  fetchProp_isAdminVerifiedAndSearchByCompanyName(
      int counter, String companyNameController) async {
    // String regexSearch = '__icontains'; // doesnt work
    var rawData = await _provider.fetchJsonList_by_prop(
      fetchUrl: ApiLinks.adminAcc_getRegex_byCompanyName_Search,
      pageSize: pageSizeVar,
      pageNum: counter,
      customSearch: "&isAdminVerified=true&companyName=$companyNameController",
    );
    return AdminAcc.fromMapList(rawData);
  }

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
  verifyAdmin_fetchById(modelObj_id) async {
    var rawData = await _provider.fetchSingleJson_by_id(
        ApiLinks.adminAcc_getAll, modelObj_id);

    return AdminAcc.fromMap(rawData);
  }

  fetchById(modelObj_id) async {
    var rawData = await _provider.fetchSingleJson_by_id(
        ApiLinks.adminAcc_getAll, modelObj_id);

    return AdminAcc.fromMap(rawData);
  }

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

  //converting a regular account into admin , by updating account db row
  update_adminAccepted(modelObjArgToAccept, modelObj_Id_Arg) async {
    var rawData = await _provider.updateApi(
        ApiLinks.adminAcc_resetAccount, modelObjArgToAccept, modelObj_Id_Arg);
    return AdminAcc.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  // delete(modelObjArg_Id) async {
  //   var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
  //   return rawData; // as api returns string, not a map
  // }

  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  deleteAdmin_account(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.adminAcc_delete, modelObjArg_Id);
    return rawData;
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class AdminAcc_sp_repo {
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // await CacheHelper.get('AdminAcc');
  // await CacheHelper.set('AdminAcc');
  // await CacheHelper.remove('AdminAcc');

  spStore_AdminAccObj(value) async {
    return await CacheHelper.set('Current_AdminAcc_obj', value);
  }

  spGet_AdminAccObj() async {
    var jsonMap = await CacheHelper.getModel('Current_AdminAcc_obj');

    if (jsonMap == null)
      return null;
    else
      return AdminAcc.fromJson(jsonMap);
  }

  spRemove_AdminAccObj() async {
    return await CacheHelper.remove('Current_AdminAcc_obj');
  }
}
