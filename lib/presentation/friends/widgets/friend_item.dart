import 'package:flutter/material.dart';
import 'package:smart_dish/domain/user/user.dart';
import 'package:smart_dish/presentation/widgets/oval_image.dart';

import '../delete_friend_dialog.dart';

class FriendItem extends StatelessWidget {
  final User user;
  const FriendItem(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: OvalImage(user.imageUrl),
      title: Text(user.userName),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => DeleteFriendDialog(user),
        ),
      ),
    );
  }
}
