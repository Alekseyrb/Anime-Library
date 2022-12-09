import 'package:anime/bloc/user_bloc.dart';
import 'package:anime/pages/home_page/home_widgets/anime_widget.dart';
import 'package:anime/reusable_widgets/background_color.dart';
import 'package:anime/reusable_widgets/progress_indicator.dart';
import 'package:anime/reusable_widgets/reusable_text_field_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeBloc = context.select((UserBloc bloc) => bloc.state);
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Anime'),
        actions: [
          IconButton(
            onPressed: () {
              userBloc.add(AnimeLoadEvent());
            },
            icon: const Icon(Icons.download_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user_page');
            },
            icon: const Icon(Icons.person_search_outlined),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushNamed(context, '/sing_in_page');
            });
          },
          icon: const Icon(Icons.transit_enterexit),
        ),
      ),
      body: backColor(
        context: context,
        child: Stack(
          children: [
            // EdgeInsets.fromLTRB(20, 90, 20, 0)
            const SizedBox(height: 10),
            if (animeBloc.isLoading)
              progressIndicator(),
            if (animeBloc.anime!.isNotEmpty) AnimeWidget(animeBloc: animeBloc),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 90, 16, 10),
              child: reusableTextFieldSearch('Search anime', userBloc, true),
            ),
          ],
        ),
      ),
    );
  }
}
