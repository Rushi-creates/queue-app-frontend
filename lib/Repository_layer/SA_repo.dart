import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/SharedPreferences_helper.dart';

class SA_api_repo {
  //Todo : (IMP) All functions of this class must be await , or else wont work
  //Todo : make sure to include JsonList method in modelClass from snipit.io

/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  // fetchAll(int counter) async {
  //   var rawData = await _provider.fetchJsonList(
  //     fetchUrl: someUrl,
  //     pageSize: pageSizeVar,
  //     pageNum: counter,
  //   );

  //   return MODEL_CLASS_NAME.fromMapList(rawData);
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

  //   return MODE_CLASS_NAME.fromMapList(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(fetchUrl, modelObj_id);

  //   return MODEL_CLASS_NAME.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  create_checkSuperAdmin(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.checkSuperAdmin, modelObj);
    return rawData; // can contain two values true OR false
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  // update(modelObj, modelObj_id) async {
  //   var rawData =
  //       await _provider.updateApi(updateApiUrl, modelObj, modelObj_id);
  //   return MODEL_CLASS_NAME.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  // delete(modelObjArg_Id) async {
  //   var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
  //   return rawData; // as api returns string, not a map
  // }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class SA_sp_repo {
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // CacheHelper.get('UserAcc');
  // await CacheHelper.set('UserAcc');
  // await CacheHelper.remove('UserAcc');

  set_SA(value) async {
    //boolean will be stored in this
    return await CacheHelper.set('SA', value);
  }

  // //! do not use await in get
  // get_SA(key) async {
  //   var jsonMap = await CacheHelper.getModel('SA');

  //   if (jsonMap == null)
  //     return null;
  //   else {
  //     bool myMap = json.decode(jsonMap);
  //     return myMap; // can have true or false
  //   }
  // }
  //! do not use await in get
  get_SA() async {
    var jsonMap = await CacheHelper.get('SA');
    print(jsonMap);
    print(jsonMap.runtimeType);

    if (jsonMap == null)
      return null;
    else {
      return jsonMap;
      // bool myMap = json.decode(jsonMap);
      // return myMap; // can have true or false
    }
  }

  remove_SA() async {
    return await CacheHelper.remove('SA');
  }
}
