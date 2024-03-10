import 'package:api_auth_flutter/helper/colors.dart';
import 'package:api_auth_flutter/pages/bottom%20nav%20page/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<NavigationBloc>();
        return BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Scaffold(
                bottomNavigationBar: Material(
                  color: background,
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      enableFeedback: false,
                      onTap: (value) {
                        bloc.add(ChangeNavEvent(selectedPage: value));
                      },
                      tabs: <Widget>[
                        Tab(
                            icon: bloc.selctedIndex == 0
                                ? Icon(
                                    Icons.home_outlined,
                                    color: icons,
                                  )
                                : Icon(
                                    Icons.home_outlined,
                                    color: icon,
                                  )),
                        Tab(
                            icon: bloc.selctedIndex == 1
                                ? Icon(
                                    Icons.manage_search_sharp,
                                    color: icons,
                                  )
                                : Icon(
                                    Icons.manage_search_sharp,
                                    color: icon,
                                  )),
                        Tab(
                            icon: bloc.selctedIndex == 2
                                ? Icon(
                                    Icons.person,
                                    color: icons,
                                  )
                                : Icon(
                                    Icons.person,
                                    color: icon,
                                  )),
                      ],
                    ),
                  ),
                ),
                body: bloc.views[bloc.selctedIndex]);
          },
        );
      }),
    );
  }
}
