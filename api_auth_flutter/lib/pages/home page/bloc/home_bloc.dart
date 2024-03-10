import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:images_picker/images_picker.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool chosen = false;
  File? image;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<ChangeImageEvent>(chooseImages);
    on<CreateAccountEvent>(createAccount);
  }

  FutureOr<void> chooseImages(
      ChangeImageEvent event, Emitter<HomeState> emit) async {
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
      CreateAccountEvent event, Emitter<HomeState> emit) async{
        
      }
}
