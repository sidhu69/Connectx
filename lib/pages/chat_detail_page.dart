import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final String name;
  final String image;

  ChatDetailPage({required this.name, required this.image});

  final List<Map<String, dynamic>> messages = [
    {'text': 'Hey Sarah! How is the project going?', 'isMe': true, 'time': '10:00 AM'},
    {'text': 'It is going great! Just finished the UI designs.', 'isMe': false, 'time': '10:02 AM'},
    {'text': 'Awesome! Can you share the screenshots?', 'isMe': true, 'time': '10:05 AM'},
    {'text': 'Sure, sending them over now 🚀', 'isMe': false, 'time': '10:06 AM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(image)),
            SizedBox(width: 12),
            Text(name, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return _buildMessage(msg['text'], msg['isMe'], msg['time']);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe, String time) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: isMe ? 50 : 0, right: isMe ? 0 : 50),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue[800] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 16)),
            SizedBox(height: 4),
            Text(time, style: TextStyle(color: isMe ? Colors.white70 : Colors.black54, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.add, color: Colors.blue[800]), onPressed: () {}),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(25)),
              child: TextField(
                decoration: InputDecoration(hintText: 'Type a message...', border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue[800],
            child: IconButton(icon: Icon(Icons.send, color: Colors.white, size: 20), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
