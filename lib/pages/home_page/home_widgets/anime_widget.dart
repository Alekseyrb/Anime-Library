import 'package:anime/bloc/user_bloc.dart';
import 'package:flutter/material.dart';

class AnimeWidget extends StatelessWidget {
  final UserState animeBloc;

  const AnimeWidget({Key? key, required this.animeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 150),
      itemCount: animeBloc.anime!.length,
      itemBuilder: (context, index) {
        final anime = animeBloc.anime![index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/anime_info_page', arguments: anime);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Container(
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
                // boxShadow:
              ),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Image.network(anime.images ?? ''),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(anime.title ?? ''),
                        const SizedBox(height: 20),
                        Text('Anime made in ${anime.year} year'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
