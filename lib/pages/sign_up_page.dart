import 'package:anime/reusable_widgets/background_color.dart';
import 'package:anime/reusable_widgets/reusable_text_field.dart';
import 'package:anime/reusable_widgets/logo_widget.dart';
import 'package:anime/reusable_widgets/sing_in_sing_up_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: backColor(
        context: context,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                reusableTextField(
                  'Enter UserName',
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  'Enter email',
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  'Enter password',
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                singInSingUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print('Created new Account');
                    Navigator.pushNamed(context, '/home_page');
                  }).onError((error, stackTrace) {
                    print('Error $error');
                    throw (Exception(error));
                  });
                }),
                const SizedBox(height: 20),
                logoWidget('assets/images/tree.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
