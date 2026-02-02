import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[800]!, Colors.blue[400]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=me'),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your Name',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _buildProfileItem(
                  Icons.person, 
                  'Edit Profile', 
                  'Name, Username, Bio, Photo', 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                  }
                ),
                _buildProfileItem(Icons.grid_on, 'My Posts', 'View and manage your posts'),
                _buildProfileItem(Icons.notifications, 'Notifications', 'Alerts, Sound, Mute'),
                _buildProfileItem(Icons.security, 'Privacy & Security', 'Blocked Users, Privacy Policy'),
                _buildProfileItem(Icons.help, 'Help & Support', 'FAQ, Contact Us'),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                  child: Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.blue[50]!, borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: Colors.blue[800]),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
