import 'package:flutter/material.dart';

class FriendsTile extends StatelessWidget {
  const FriendsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          radius: 32,
          child: Icon(Icons.person),
        ),
        title: Text("Friend"),
        subtitle: Text("325 Points"),
      ),
    );
  }
}
