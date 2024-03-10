part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CreateAccountEvent extends HomeEvent {
  final String title;
  final String description;
  final int price;
  final int categoryId;

  CreateAccountEvent(
      {required this.title,
      required this.description,
      required this.price,
      required this.categoryId});
}

class ChangeImageEvent extends HomeEvent {}
