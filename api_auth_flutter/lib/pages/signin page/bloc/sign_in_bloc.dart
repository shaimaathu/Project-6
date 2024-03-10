import 'dart:async';

import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<AddSignInEvent>(signin);
  }

  FutureOr<void> signin(AddSignInEvent event, Emitter<SignInState> emit) async{
        try {
      emit(LoadingState());
      await Api().logIn(email: event.email, password: event.password);
      emit(AddSignInState());
    } catch (error) {
      emit(ErrorState());
    }
  }
}


