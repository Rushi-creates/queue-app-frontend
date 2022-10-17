// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import 'package:no_queue2/Global_blocProviders/bloc/diff_profile_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__AdminHome__/AdminVerify_logic/admin_verify_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueueUserCud__/QueueUser_cud_logic/QueueUser_cud_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueueUserFetch__/QueueUser_fetch_logic/QueueUser_fetch_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueueUserFetch__/Queue_fetch_id_logic/Queue_fetch_id_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueuesCud__/Queues_cud_logic/Queues_cud_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueuesFetch__/Admin_fetch_id_logic/admin_fetch_id_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueuesFetch__/Queues_fetch_id_logic/queues_fetch_id_bloc.dart';
import 'package:no_queue2/Logic/ADMIN/__QueuesFetch__/Queues_fetch_logic/Queues_fetch_bloc.dart';
import 'package:no_queue2/Logic/COMMON/Splash_roles_logic/splash_roles_bloc.dart';
import 'package:no_queue2/Logic/SUPERADMIN/__SaAuth__/Sa_auth_logic/sa_auth_bloc.dart';
import 'package:no_queue2/Logic/SUPERADMIN/__SuperAdminHome__/Admin_ReqList_logic/admin_request_list_bloc.dart';
import 'package:no_queue2/Logic/SUPERADMIN/__SuperAdminHome__/logout_sa_logic/logout_sa_bloc.dart';
import 'package:no_queue2/Logic/USER/CustomNavBar_logic/custom_nav_bar_bloc.dart';

import 'Global_blocProviders/Cache_provider/cache_provider_bloc.dart';
import 'Logic/ADMIN/__QueueUserFetch__/CurrentQueues_fetch_logic/CurrentQueues_fetch_bloc.dart';
import 'Logic/ADMIN_AUTH/__AdminLogin__/AdminLoginButton_logic/admin_login_button_bloc.dart';
import 'Logic/ADMIN_AUTH/__AdminOtp__/AdminOtpButton_logic/admin_otp_button_bloc.dart';
import 'Logic/ADMIN_AUTH/__AdminReg__/AdminRegButton_logic/admin_reg_button_bloc.dart';
import 'Logic/ADMIN_AUTH/__AdminSettings__/AdminLod_logic/admin_lod_bloc.dart';
import 'Logic/ADMIN_AUTH/__AdminSwitchScreen__/AdminSwitchScreen_logic/admin_switch_screen_bloc.dart';
import 'Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';
import 'Logic/USER_AUTH/__UserLogin__/UserLoginButton_logic/user_login_button_bloc.dart';
import 'Logic/USER_AUTH/__UserLogin__/UserLoginForm_logic/user_login_form_bloc.dart';
import 'Logic/USER_AUTH/__UserOtp__/UserOtpButton_logic/user_otp_button_bloc.dart';
import 'Logic/USER_AUTH/__UserReg__/UserRegButton_logic/user_reg_button_bloc.dart';
import 'Logic/USER_AUTH/__UserSettings__/UserLod_logic/user_lod_bloc.dart';
import 'Logic/USER_AUTH/__UserSwitchScreen__/UserSwitchScreen_logic/user_switch_screen_bloc.dart';
import 'Screens/COMMON/SplashScreen.dart';
import 'service_layer/services/SharedPreferences_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //@ CUBITS
        BlocProvider(
          create: (context) => DiffProfileBloc(),
        ),
        BlocProvider(
          create: (context) => SpBlocProviderBloc(),
        ),
        BlocProvider(
          create: (context) => CacheProviderBloc(),
        ),

        //@ BLOCS
        BlocProvider(
          create: (context) => SplashRolesBloc(),
        ),
        BlocProvider(
          create: (context) => CustomNavBarBloc(),
        ),
        BlocProvider(
          create: (context) => UserSwitchScreenBloc(),
        ),
        BlocProvider(
          create: (context) => UserLoginFormBloc(),
        ),

        BlocProvider(
          create: (context) => UserOtpButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserLoginButtonBloc(),
        ),
        BlocProvider(
          create: (context) => UserLodBloc(),
        ),
        BlocProvider(
          create: (context) => UserRegButtonBloc(),
        ),

        //admin
        BlocProvider(
          create: (context) => AdminSwitchScreenBloc(),
        ),
        BlocProvider(
          create: (context) => AdminOtpButtonBloc(),
        ),
        BlocProvider(
          create: (context) => AdminLoginButtonBloc(),
        ),
        BlocProvider(
          create: (context) => AdminLodBloc(),
        ),
        BlocProvider(
          create: (context) => AdminRegButtonBloc(),
        ),
        BlocProvider(
          create: (context) => AdminVerifyBloc(),
        ),
        BlocProvider(
          create: (context) => SaAuthBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutSaBloc(),
        ),
        BlocProvider(
          create: (context) => AdminRequestListBloc(),
        ),
        BlocProvider(
          create: (context) => SearchAdminFetchBloc(),
        ),
        BlocProvider(
          create: (context) => QueuesFetchIdBloc(),
        ),
        BlocProvider(
          create: (context) => AdminFetchIdBloc(),
        ),
        BlocProvider(
          create: (context) => QueuesFetchBloc(),
        ),
        BlocProvider(
          create: (context) => QueuesCudBloc(),
        ),
        BlocProvider(
          create: (context) => QueueUserFetchBloc(),
        ),
        BlocProvider(
          create: (context) => QueueUserCudBloc(),
        ),
        BlocProvider(
          create: (context) => CurrentQueuesFetchBloc(),
        ),

        BlocProvider(
          create: (context) => QueueFetchIdBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Skip Line',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // onGenerateRoute: _appRouter.onGenerateRoute, //dont pass brackets here

          home: SplashScreen()),
    );
  }

  // @override
  // void dispose() {
  //   _appRouter.dispose();
  //   super.dispose();
  // }
}
