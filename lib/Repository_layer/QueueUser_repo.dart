import 'dart:convert';

import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

import '../service_layer/models/QueueUser.dart';
import '../service_layer/services/ApiHelper.dart';

class QueueUser_api_repo {
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
// /* -------------------------------------------------------------------------- */
//   fetchAll(int counter) async {
//     var rawData = await _provider.fetchJsonList(
//       fetchUrl: someUrl,
//       pageSize: pageSizeVar,
//       pageNum: counter,
//     );

//     return MODEL_CLASS_NAME.fromJsonList(rawData);
//   }

/* -------------------------------------------------------------------------- */
/*                              //! Fetch by Prop                             */
/* -------------------------------------------------------------------------- */

  fetchProp_andSearchBy_queue_fk(int counter, int queue_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.getQueueUser,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&queue_fk=$queue_fk');

    return QueueUser.fromMapList(rawData);
  }

  fetchProp_currentQueues_by_userAcc_fk(int counter, int userAcc_fk) async {
    var rawData = await _provider.fetchJsonList_by_prop(
        fetchUrl: ApiLinks.getQueueUser,
        pageSize: pageSizeVar,
        pageNum: counter,
        customSearch: '&userAcc_fk=$userAcc_fk');

    return QueueUser.fromMapList(rawData);
  }

// /* -------------------------------------------------------------------------- */
// /*                               //! Fetch by id                              */
// /* -------------------------------------------------------------------------- */
//   fetchById(modelObj_id) async {
//     var rawData = await _provider.fetchSingleJson_by_id(fetchUrl, modelObj_id);

//     return MODEL_CLASS_NAME.fromJson(rawData);
//   }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  create(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.addQueueUser, modelObj);
    // var decodedJson = json.decode(rawData);

    print('&&&&&& $rawData');

    if (rawData is String)
      return rawData;
    else if (rawData is Map<String, dynamic>) return QueueUser.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
  update(modelObj, modelObj_id) async {
    var rawData = await _provider.updateApi(
        ApiLinks.updateQueueUser, modelObj, modelObj_id);
    return QueueUser.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Delete                                 */
/* -------------------------------------------------------------------------- */
  // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
  delete(modelObjArg_Id) async {
    var rawData =
        await _provider.deleteApi(ApiLinks.deleteQueueUser, modelObjArg_Id);
    // return json.decode(rawData); // as api returns string, not a map
    return rawData; // as api returns string, not a map
  }

/* -------------------------------------------------------------------------- */
/*                   //! Notify next 5th queueUser by email                   */
/* -------------------------------------------------------------------------- */

  rawAdd_notifyQU_byEmail(String queueUser_email) async {
    var rawData = await _provider.raw_addApi(
        ApiLinks.notifyQu_byEmail, {"userAcc_name": queueUser_email});

    return rawData;
  }
}
