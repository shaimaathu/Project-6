import 'dart:async';

import 'package:api_auth_flutter/pages/home%20page/Home_page.dart';
import 'package:api_auth_flutter/pages/profile/profile_page.dart';
import 'package:api_auth_flutter/pages/category%20page/search_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  List<Widget> views = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];
  int selctedIndex = 0;
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) {});
    on<ChangeNavEvent>(changePage);
  }

  FutureOr<void> changePage(
      ChangeNavEvent event, Emitter<NavigationState> emit) {
    selctedIndex = event.selectedPage;
    emit(ChangeNavState());
  }
}
