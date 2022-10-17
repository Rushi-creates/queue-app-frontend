import '../Repository_layer/UserAcc_repo.dart';
import '../service_layer/models/UserAcc.dart';

class Funcs {
  static getMySp_user() async {
    UserAcc_sp_repo userAcc_sp_repo = UserAcc_sp_repo();
    UserAcc? myUser = await userAcc_sp_repo.spGet_UserAccObj();
    return myUser?.id;
  }
}
