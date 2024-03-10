part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

class ChangeNavEvent extends NavigationEvent {
  final int selectedPage;
  ChangeNavEvent({required this.selectedPage});
}
