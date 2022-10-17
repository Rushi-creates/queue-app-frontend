import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/COMPONENTS/myComponents.dart';

import '../../../Global_blocProviders/Sp_provider/sp_bloc_provider_bloc.dart';
import '../../../Logic/ADMIN/__QueuesFetch__/Admin_fetch_id_logic/admin_fetch_id_bloc.dart';

class ShopInfo_card extends StatelessWidget {
  final fromDiffProfile;
  const ShopInfo_card({super.key, required this.fromDiffProfile});

  @override
  Widget build(BuildContext context) {
    return displayShopInfo_Card(context);
  }

/* -------------------------------------------------------------------------- */
/*                            //! show shop info :                            */
/* -------------------------------------------------------------------------- */

  displayShopInfo_Card(context) {
    return Card(
      // elevation: 9,
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: [
              Flexible(
                child: FittedBox(child: display_ShopInfo_text(context)),
                flex: 1,
              ),
              Flexible(
                child: Image.asset(
                  "images/store_queue_green.png",
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  display_ShopInfo_text(context) {
    if (fromDiffProfile == null) {
      BlocProvider.of<SpBlocProviderBloc>(context)
          .add(sp_adminAccObj_Get_Event());

      return sp_adminAccObj_BlocProvider_STATES();
    } else {
      BlocProvider.of<AdminFetchIdBloc>(context)
          .add(Admin_FetchById_onButtonPressed_Event(fromDiffProfile.id));
      return states_for_fetchSingleById();
    }
  }

  sp_adminAccObj_BlocProvider_STATES() {
    return BlocBuilder<SpBlocProviderBloc, SpBlocProviderState>(
      builder: (context, state) {
        if (state is Sp_adminAccObj_Got_State) {
          return buildFetchObj(state.sp_adminAccObj);
        }
        return Text('Cant retreive data');
      },
    );
  }

  states_for_fetchSingleById() {
    return BlocConsumer<AdminFetchIdBloc, AdminFetchIdState>(
      listener: (context, state) {
        if (state is Admin_FetchById_Error_State) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Some Network error'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Admin_FetchById_Error_State) {
          return connectionErrorText(state.error);
        } else if (state is Admin_FetchById_Loading_State) {
          return MyComponents.buildLoading();
        } else if (state is Admin_FetchById_Loaded_State) {
          return buildFetchObj(state.modelObj);
        }
        return MyComponents.buildLoading();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  buildFetchObj(modelObj) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 15, 15.0, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildText('Shop name', '${modelObj.companyName}'),
          buildText('Category', '${modelObj.category}'),
          buildText('Address', '${modelObj.loc_firstLine}'),
          buildText('City', '${modelObj.loc_secondLine}'),
          buildText('Pincode', '${modelObj.loc_pincode}')
        ],
      ),
    );
  }

  buildText(String label, String value) {
    return Text(
      '$label : ${value.length >= 15 ? value.substring(0, 15) : value}',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.teal[900],
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w300,
        fontSize: 17.0,
      ),
    );
  }

  connectionErrorText(error) {
    return Center(
      child: Text(
        'Connection error or \n Error: $error',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
