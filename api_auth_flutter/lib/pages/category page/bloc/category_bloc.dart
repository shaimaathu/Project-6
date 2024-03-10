import 'dart:async';
import 'dart:io';

import 'package:api_auth_flutter/data/nerworking/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:images_picker/images_picker.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  bool chosen = false;
  File? image;
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});
    on<ChangeImageEvent>(chooseImages);
    on<CreateCategoryEvent>(createCategory);
  }

  FutureOr<void> chooseImages(
      ChangeImageEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(LoadingState());
      var img = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
      );
      chosen = true;
      image = File(img![0].path);
      emit(UpdateImageState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> createCategory(
      CreateCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(LoadingState());
      final urlImageServer = await Api().uploadImageMethod(image: image!);
      print(urlImageServer.location);
      await Api()
          .createCategories(name: event.name, images: urlImageServer.location);
      emit(SuccessState());
    } catch (error) {
      print(error);
      emit(ErrorState());
    }
  }
}
