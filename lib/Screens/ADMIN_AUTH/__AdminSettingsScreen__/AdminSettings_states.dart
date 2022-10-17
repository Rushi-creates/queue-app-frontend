import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';

class AdminSettingsScreenStates {
  static sp_adminAccObj_BlocProvider_STATES() {
    return BlocConsumer<SpBlocProviderBloc, SpBlocProviderState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Sp_adminAccObj_Got_State) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your email  : ${state.sp_adminAccObj.email}'),
                Text('Your number : ${state.sp_adminAccObj.number}'),
              ],
            ),
          );
        }
        return Text('Cant retreive data');
      },
    );
  }
}
