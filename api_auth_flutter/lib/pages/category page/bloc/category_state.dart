part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class LoadingState extends CategoryState {}

final class SuccessState extends CategoryState {}

final class ErrorState extends CategoryState {}

final class UpdateImageState extends CategoryState {}
