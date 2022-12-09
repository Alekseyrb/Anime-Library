import 'package:anime/bloc/user_bloc.dart';
import 'package:anime/pages/user_search_page/user_search_widgets/user_widget.dart';
import 'package:anime/reusable_widgets/background_color.dart';
import 'package:anime/reusable_widgets/progress_indicator.dart';
import 'package:anime/reusable_widgets/reusable_text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userState = context.select((UserBloc bloc) => bloc.state);
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('User Search'),
      ),
      body: backColor(
        context: context,
        child: Stack(
          children: [
            if (userState.isLoading)
              progressIndicator(),
            if (userState.users!.isNotEmpty)
              UserWidget(userState: userState),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 90, 16, 10),
              child: reusableTextFieldSearch('Search User', userBloc, false),
            ),
          ],
        ),
      ),
    );
  }
}
