import 'package:anime/models/user_model.dart';
import 'package:anime/reusable_widgets/background_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(user.username ?? ''),
        centerTitle: true,
      ),
      body: backColor(
        context: context,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
          child: Column(
            children: [
              Hero(
                tag: user.username ?? '',
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.images ?? ''),
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
                        text: user.url ?? '',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
