part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CreateCategoryEvent extends CategoryEvent {
  final String name;

  CreateCategoryEvent({
    required this.name,
  });
}

class ChangeImageEvent extends CategoryEvent {}
