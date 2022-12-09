import 'package:anime/bloc/user_bloc.dart';
import 'package:flutter/material.dart';

TextField reusableTextFieldSearch(
    String text, UserBloc userBloc, bool isAnime) {
  return TextField(
    onChanged: (value) {
      if (isAnime) {
        userBloc.add(AnimeSearchEvent(value));
      } else {
        userBloc.add(UserSearchEvent(value));
      }
    },
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
  );
}
