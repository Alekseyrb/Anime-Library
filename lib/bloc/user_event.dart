part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserSearchEvent extends UserEvent {
  final String query;

  UserSearchEvent(this.query);
}

class AnimeSearchEvent extends UserEvent {
  final String query;

  AnimeSearchEvent(this.query);
}

class AnimeLoadEvent extends UserEvent {}
