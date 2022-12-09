import 'package:anime/pages/home_page/anime_info_page/anime_info_page.dart';
import 'package:anime/pages/home_page/home_page.dart';
import 'package:anime/pages/sign_in_page.dart';
import 'package:anime/pages/sign_up_page.dart';
import 'package:anime/pages/user_search_page/user_info_page/user_info_page.dart';
import 'package:anime/pages/user_search_page/user_search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: const Routes(),
    );
  }
}

class Routes extends StatelessWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      // initialRoute: '/sing_in_page',
      initialRoute: '/home_page',
      routes: {
        '/sing_in_page': (context) => const SingInPage(),
        '/sing_up_page': (context) => const SingUpPage(),
        '/home_page': (context) => const HomePage(),
        '/anime_info_page': (context) => const AnimeInfoPage(),
        '/user_page': (context) => const UserPage(),
        '/user_info_page': (context) => const UserInfoPage(),
      },
    );
  }
}
