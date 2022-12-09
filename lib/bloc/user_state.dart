part of 'user_bloc.dart';

class UserState {
  final List<UserModel>? users;
  final List<AnimeModel>? anime;
  final bool isLoading;

  UserState({
    this.users = const [],
    this.anime = const [],
    this.isLoading = false,
  });

  UserState copyWith({
    List<AnimeModel>? anime,
    List<UserModel>? users,
    bool isLoading = false,
  }) {
    return UserState(
      users: users ?? this.users,
      anime: anime ?? this.anime,
      isLoading: isLoading,
    );
  }
}

// abstract class UserState {}
//
// class UserInitialState extends UserState {}
//
// class UserSearchState extends UserState {
//   final List<UserModel> users;
//
//   UserSearchState({this.users = const []});
// }
//
// class AnimeSearchState extends UserState {
//   final List<AnimeModel> animes;
//
//   AnimeSearchState({this.animes = const []});
// }
//
// class AnimeLoadState extends UserState {
//   final List<AnimeModel> animes;
//
//   AnimeLoadState({this.animes = const []});
// }
