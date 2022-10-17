import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

import '../service_layer/models/Queues.dart';
import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/SharedPreferences_helper.dart';

class Queues_api_repo {
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

  //   return Queues.fromMapList(rawData);
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

  //   return Queues.fromMapList(rawData);
  // }

  fetchProp_searchBy_AdminAccFk(int counter, int adminAcc_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.getQueue,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&adminAcc_fk=$adminAcc_fk');

    return Queues.fromMapList(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  fetchById(modelObj_id) async {
    var rawData =
        await _provider.fetchSingleJson_by_id(ApiLinks.getQueue, modelObj_id);

    return Queues.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  create(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.addQueue, modelObj);

    if (rawData is String) {
      return rawData;
    } else {
      return Queues.fromMap(rawData);
    }
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  update(modelObj, modelObj_id) async {
    var rawData =
        await _provider.updateApi(ApiLinks.updateQueue, modelObj, modelObj_id);
    return Queues.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  delete(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.deleteQueue, modelObjArg_Id);
    return rawData; // as api returns string, not a map
  }
}

/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

class Queues_sp_repo {
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // CacheHelper.get('UserAcc');
  // await CacheHelper.set('UserAcc');
  // await CacheHelper.remove('UserAcc');

  // set_queues(value) async {
  //   return await CacheHelper.set('queues', value);
  // }

  // //! do not use await in get
  // get_queues(key) {
  //   return CacheHelper.get(key);
  // }

  // remove_queues(key) async {
  //   return await CacheHelper.remove(key);
  // }
}
