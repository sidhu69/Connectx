import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _ProfileItem {
  final String label;
  final TextEditingController controller;
  final IconData icon;

  _ProfileItem(this.label, this.controller, this.icon);
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<_ProfileItem> _items = [
    _ProfileItem('Display Name', TextEditingController(text: 'Your Name'), Icons.person),
    _ProfileItem('Username', TextEditingController(text: 'your_username'), Icons.alternate_email),
    _ProfileItem('Bio', TextEditingController(text: 'I love ConnectX!'), Icons.info_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profile updated successfully!')),
              );
              Navigator.pop(context);
            },
            child: Text('Save', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=me'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue[800],
                    radius: 18,
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ..._items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: item.controller,
                maxLines: item.label == 'Bio' ? 3 : 1,
                decoration: InputDecoration(
                  labelText: item.label,
                  prefixIcon: Icon(item.icon, color: Colors.blue[800]),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[800]!, width: 2),
                  ),
                ),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var item in _items) {
      item.controller.dispose();
    }
    super.dispose();
  }
}
