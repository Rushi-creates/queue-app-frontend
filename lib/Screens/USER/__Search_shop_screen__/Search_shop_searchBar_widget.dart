import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';

class Search_shop_searchBar_widget extends StatelessWidget {
  final searchAdminController;
  const Search_shop_searchBar_widget(
      {super.key, required this.searchAdminController});

  @override
  Widget build(BuildContext context) {
    return mySearchBarDecoration(context);
  }

  mySearchBarDecoration(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(child: searchTextField(context)),
        ),
      ),
    );
  }

  searchTextField(context) {
    return TextField(
      autofocus: true,
      onChanged: (value) {
        // to refresh the previous search lists
        BlocProvider.of<SearchAdminFetchBloc>(context)
            .add(SearchAdmin_Fetch_onRefresh_Event());
      },
      controller: searchAdminController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.shopping_bag_outlined),
          suffixIcon: performSearchButtonUi(context),
          hintText: 'Search...',
          border: InputBorder.none),
    );
  }

  performSearchButtonUi(context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.teal,
        child: CircleAvatar(
          backgroundColor: Colors.teal,
          child: FittedBox(
            child: Center(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  //# to call first set of pages
                  BlocProvider.of<SearchAdminFetchBloc>(context).add(
                      SearchAdmin_Fetch_onInit_Event(
                          searchAdminController.text));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
