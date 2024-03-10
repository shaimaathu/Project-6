import 'dart:async';
import 'dart:io';
import 'package:api_auth_flutter/data/models/user_models.dart';
import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:meta/meta.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  bool chosen = false;
  File? image;
  SignUpBloc() : super(SignUpInitial()) {
    on<ChangeImageEvent>(chooseImages);
    on<CreateAccountEvent>(createAccount);
  }

  FutureOr<void> chooseImages(
      ChangeImageEvent event, Emitter<SignUpState> emit) async {
    try {
      emit(LoadingState());
      var img = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
      );
      chosen = true;
      image = File(img![0].path);
      print(image!.path);
      emit(UpdateImageState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> createAccount(
      CreateAccountEvent event, Emitter<SignUpState> emit) async {
    try {
      emit(LoadingState());
      final urlImageServer = await Api().uploadImageMethod(image: image!);
      print(urlImageServer.location);
      UserModel user = UserModel(
          email: event.email,
          name: event.name,
          password: event.password,
          avatar: urlImageServer.location);
      await Api().signUpMethod(user: user);
      emit(SuccessState());
    } catch (error) {
      print(error);
      emit(ErrorState());
    }
  }
}
