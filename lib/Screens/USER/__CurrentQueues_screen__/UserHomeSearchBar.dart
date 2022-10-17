import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_queue2/Screens/USER/__Search_shop_screen__/Search_shop_screen.dart';

import '../../../../../../Logic/USER/__UserBottomBarSwitch__/SearchAdmin_fetch_logic/SearchAdmin_fetch_bloc.dart';

class UserHomeSearchBar extends StatelessWidget {
  // final searchAdminController;
  const UserHomeSearchBar(
      // {super.key, required this.searchAdminController}
      );

  @override
  Widget build(BuildContext context) {
    return mySearchBarDecoration(context);
  }

  mySearchBarDecoration(context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 8.0, 1, 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Search_shop_screen();
              }));
            },
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 15,
                  child: Card(
                    elevation: 3,
                    child: Container(
                      // width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5)),
                      // child: Center(child: searchTextField(context)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Text(
                            'Search shops here',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                // Flexible(
                //   flex: 1,
                //   child: IconButton(
                //     icon: Icon(Icons.shopping_bag_outlined),
                //     onPressed: null,
                //   ),
                // ),
                SizedBox(width: 8)
              ],
            ),
          ),
        ),
      ],
    );
  }

  // searchTextField(context) {
  //   return TextField(
  //     autofocus: false,
  //     onTap: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return Search_shop_screen();
  //       }));
  //     },
  //     // onChanged: (value) {
  //     //   // to refresh the previous search lists
  //     //   BlocProvider.of<SearchAdminFetchBloc>(context)
  //     //       .add(SearchAdmin_Fetch_onRefresh_Event());
  //     // },
  //     // controller: searchAdminController,
  //     decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.shopping_bag_outlined),
  //         // suffixIcon: performSearchButtonUi(context),
  //         hintText: 'Search...',
  //         border: InputBorder.none),
  //   );
  // }

  // performSearchButtonUi(context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: Card(
  //       color: Colors.teal,
  //       child: CircleAvatar(
  //         backgroundColor: Colors.teal,
  //         child: FittedBox(
  //           child: Center(
  //             child: IconButton(
  //               icon: Icon(Icons.search),
  //               onPressed: () {
  //                 //# to call first set of pages
  //                 BlocProvider.of<SearchAdminFetchBloc>(context).add(
  //                     SearchAdmin_Fetch_onInit_Event(
  //                         searchAdminController.text));
  //               },
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
