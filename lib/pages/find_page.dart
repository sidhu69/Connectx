import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'name': 'Alex Rivers', 'bio': 'Traveler & Photographer', 'image': 'https://i.pravatar.cc/150?u=alex'},
    {'name': 'Sarah Chen', 'bio': 'UI/UX Designer | Coffee Lover', 'image': 'https://i.pravatar.cc/150?u=sarah'},
    {'name': 'Marcus Thorne', 'bio': 'Tech Enthusiast | Gamer', 'image': 'https://i.pravatar.cc/150?u=marcus'},
    {'name': 'Elena Vance', 'bio': 'Writer & Philosophy Student', 'image': 'https://i.pravatar.cc/150?u=elena'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user['image']!),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        user['bio']!,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person_add, color: Colors.blue[800]),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Friend request sent to ${user['name']}')),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
