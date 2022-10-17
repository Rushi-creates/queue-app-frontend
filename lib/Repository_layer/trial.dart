







// import 'dart:convert';

// import 'package:no_queue2/service_layer/services/secret_credentials/global.dart';

// import '../service_layer/services/ApiHelper.dart';

// class Koo_api_repo {

//   final  modelClass ;

//   Koo_api_repo.named({required this.modelClass});  //pass AdminAcc while calling

//   //Todo : (IMP) All functions of this class must be await , or else wont work
//   //Todo : make sure to include JsonList method in modelClass from snipit.io
  

// /* -------------------------------------------------------------------------- */
// /*                               //! Field vars                               */
// /* -------------------------------------------------------------------------- */

//   final _provider = ApiHelper.ApiHelperObj;
//   final links = ApiLinks;

//   int pageSizeVar = 15;  // used in pagination of fetches


// /* -------------------------------------------------------------------------- */
// /*                                //! Fetch All                               */
// /* -------------------------------------------------------------------------- */
//   fetchAll(int counter) async {
//     var rawData = await _provider.fetchJsonList(
//       fetchUrl: someUrl,
//       pageSize: pageSizeVar,
//       pageNum: counter,
//     );

//     return modelClass.fromMapList(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                              //! Fetch by Prop                             */
// /* -------------------------------------------------------------------------- */

//   fetchProp(int counter) async {
//     var rawData = await _provider.fetchJsonList_by_prop(
//       fetchUrl: someUrl,
//       pageSize: pageSizeVar,
//       pageNum: counter,
//       customSearch: );

//     return modelClass.fromMapList(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                               //! Fetch by id                              */
// /* -------------------------------------------------------------------------- */
//   fetchById(modelObj_id) async {
//     var rawData = await _provider.fetchSingleJson_by_id(fetchUrl, modelObj_id);

//     return modelClass.fromMap(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Create                                 */
// /* -------------------------------------------------------------------------- */
//   create(modelObj) async {
//     var rawData = await _provider.addApi(addApiUrl, modelObj);
//     return modelClass.fromMap(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Update                                 */
// /* -------------------------------------------------------------------------- */
//   update(modelObj, modelObj_id) async {
//     var rawData =
//         await _provider.updateApi(updateApiUrl, modelObj, modelObj_id);
//     return modelClass.fromMap(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Delete                                 */
// /* -------------------------------------------------------------------------- */
//   // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
// }



// /* -------------------------------------------------------------------------- */
// /*                          //@ SP Repo class                                 */
// /* -------------------------------------------------------------------------- */

// class Koo_sp_repo {

//   //Todo : while using sp , make sure to use await , kw , or it wont work
//   // CacheHelper.get('UserAcc');
//   // await CacheHelper.set('UserAcc');
//   // await CacheHelper.remove('UserAcc');

//   set_koo(value) async {
//    return await CacheHelper.set('koo', value);
//   }

//   //! do not use await in get
//   get_koo(key)  {
//    return CacheHelper.get(key);
//   }

//   remove_koo(key) async {
//    return await CacheHelper.remove(key);
//   }
// }



