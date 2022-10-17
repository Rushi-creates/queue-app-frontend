import 'dart:convert';

/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */
String basicAuth_username = 'rushi.creates';
// String basicAuth_password = 'noq@123***';
String basicAuth_password = 'noq@1*2*3*';
String basicAuth = 'Basic ' +
    base64Encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

class ApiLinks {
/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */
  static const String domainUrl = 'https://no-q.herokuapp.com/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

//@ notify next 5th queueuser by email (for his turn)
  static String notifyQu_byEmail = domainUrl + 'notifyUpcomingUserByEmail/';

//@ Super admin
  static String checkSuperAdmin = domainUrl + 'sa/checkSuperAdmin/';

//@ UserAcc
  static const String userAcc_getAll = domainUrl + 'userAcc/';
  static const String userAcc_register = domainUrl + 'userAcc/register/';
  static const String userAcc_resetAccount =
      domainUrl + 'userAcc/resetAccount/';
  static const String userAcc_delete = domainUrl + 'userAcc/delete/';

  static const String userAcc_login = domainUrl + 'userAcc/login_userAcc/';
  static const String userAcc_forgotPass =
      domainUrl + 'userAcc/forgotPasword_userAcc/';
  static const String userAcc_verify_userEmail_beforeRegister =
      domainUrl + 'userAcc/verify_userEmail_beforeRegister/';

//@ AdminAcc

  static const String adminAcc_getRegexSearch =
      domainUrl + 'adminAcc/get_regex_AdminAcc/';
  static const String adminAcc_getRegex_byCompanyName_Search =
      domainUrl + 'adminAcc/get_regex_byCompanyName_AdminAcc/';

  static const String adminAcc_getAll = domainUrl + 'adminAcc/';
  static const String adminAcc_register = domainUrl + 'adminAcc/register/';
  static const String adminAcc_resetAccount =
      domainUrl + 'adminAcc/resetAccount/';
  static const String adminAcc_delete = domainUrl + 'adminAcc/delete/';

  static const String adminAcc_login = domainUrl + 'adminAcc/login_adminAcc/';
  static const String adminAcc_forgotPass =
      domainUrl + 'adminAcc/forgotPasword_adminAcc/';
  static const String adminAcc_verify_adminEmail_beforeRegister =
      domainUrl + 'adminAcc/verify_adminEmail_beforeRegister/';

//@ Queue
  static const String getQueue = domainUrl + "queue/";
  static const String addQueue = domainUrl + "queue/add/";
  static const String updateQueue = domainUrl + "queue/update/";
  static const String deleteQueue = domainUrl + "queue/delete/";
  static const String deleteQueueByUid = domainUrl + "queue/deleteByUid/";

  //@ QueueUser
  static const String getQueueUser = domainUrl + "queueUser/";
  static const String addQueueUser = domainUrl + "queueUser/add/";
  static const String updateQueueUser = domainUrl + "queueUser/update/";
  static const String deleteQueueUser = domainUrl + "queueUser/delete/";
  static const String deleteQueueUserByUid =
      domainUrl + "queueUser/deleteByUid/";
}
