import 'package:anime/models/anime_model.dart';
import 'package:anime/reusable_widgets/background_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimeInfoPage extends StatelessWidget {
  const AnimeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = ModalRoute.of(context)!.settings.arguments as AnimeModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(anime.title ?? ''),
      ),
      body: backColor(
        context: context,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
            child: Column(
              children: [
                Hero(
                  tag: anime.title ?? '',
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(anime.images ?? ''),
                      ),
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16),
                    children: [
                      const TextSpan(text: 'Visit site: '),
                      TextSpan(
                        text: anime.url ?? '',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                Text(
                  anime.trailer ?? '',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  anime.year.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
