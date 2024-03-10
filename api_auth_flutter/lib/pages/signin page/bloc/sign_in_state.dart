part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class LoadingState extends SignInState {}

final class AddSignInState extends SignInState {}

final class ErrorState extends SignInState {}