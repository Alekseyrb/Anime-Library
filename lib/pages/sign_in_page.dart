import 'package:anime/reusable_widgets/background_color.dart';
import 'package:anime/reusable_widgets/reusable_text_field.dart';
import 'package:anime/reusable_widgets/logo_widget.dart';
import 'package:anime/reusable_widgets/sing_in_sing_up_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backColor(
        context: context,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                Center(child: logoWidget('assets/images/tree.png')),
                const SizedBox(height: 30),
                reusableTextField(
                  'Enter Email',
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  'Enter Password',
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                singInSingUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.pushNamed(context, '/home_page');
                  }).onError((error, stackTrace) {
                    print('Error $error');
                  });
                }),
                singUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row singUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account? ',
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sing_up_page');
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
