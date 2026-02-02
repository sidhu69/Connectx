import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  final List<Map<String, String>> friends = [
    {'name': 'Sarah Chen', 'lastMessage': 'See you at the cafe!', 'time': '2m ago', 'image': 'https://i.pravatar.cc/150?u=sarah'},
    {'name': 'Alex Rivers', 'lastMessage': 'Check out these photos!', 'time': '1h ago', 'image': 'https://i.pravatar.cc/150?u=alex'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(friend['image']!),
          ),
          title: Text(friend['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(friend['lastMessage']!, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(friend['time']!, style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 4),
              Icon(Icons.chevron_right, size: 16, color: Colors.grey),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}
