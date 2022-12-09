import 'package:anime/bloc/user_bloc.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final UserState userState;
  const UserWidget({Key? key, required this.userState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 150),
      itemCount: userState.users!.length,
      itemBuilder: (context, index) {
        final user = userState.users![index];
        return ListTile(
          title: Text(user.username ?? ''),
          leading: Hero(
            tag: user.username ?? '',
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.images ?? ''),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/user_info_page',
                arguments: user);
          },
        );
      },
    );
  }
}
