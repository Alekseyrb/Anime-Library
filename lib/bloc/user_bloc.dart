import 'dart:async';

import 'package:anime/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/anime_model.dart';

part 'user_event.dart';

part 'user_state.dart';

const _apiUrlUser = 'https://api.jikan.moe/v4/users';
const _apiUrlAnime = 'https://api.jikan.moe/v4/anime';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UserSearchEvent>(_onSearchUser,
        transformer: debounceDroppable(const Duration(milliseconds: 500)));
    on<AnimeSearchEvent>(_onSearchAnime,
        transformer: debounceDroppable(const Duration(milliseconds: 500)));
    on<AnimeLoadEvent>(_onLoadAnime);
  }

  final _httpClient = Dio();

  _onSearchUser(UserSearchEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    if (event.query.isEmpty) return emit(state.copyWith(users: []));
    if (event.query.length < 3) return;
    try {
      final res = await _httpClient.get(
        _apiUrlUser,
        queryParameters: {
          'q': event.query,
        },
      );
      final users = (res.data['data'] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
      emit(state.copyWith(users: users));
    } catch (e) {
      print(e);
      // emit(UserState(users: []));
      // throw Exception(e);
    }
  }

  _onSearchAnime(AnimeSearchEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    if (event.query.isEmpty) return emit(state.copyWith(anime: []));
    if (event.query.length < 3) return;
    try {
      final res = await _httpClient.get(
        _apiUrlAnime,
        queryParameters: {
          'q': event.query,
        },
      );
      final anime = (res.data['data'] as List)
          .map((json) => AnimeModel.fromJson(json))
          .toList();
      emit(state.copyWith(anime: anime));
    } catch (e) {
      print(e);
    }
  }

  _onLoadAnime(AnimeLoadEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final res = await _httpClient.get(
        _apiUrlAnime,
      );
      final anime = (res.data['data'] as List)
          .map((json) => AnimeModel.fromJson(json))
          .toList();
      emit(state.copyWith(anime: anime));
    } catch (e) {
      print(e);
    }
  }
}
