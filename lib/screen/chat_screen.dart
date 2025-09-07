import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        "isMe": false,
        "text":
        "Hi there, thanks for applying for the position. We'd like to schedule a quick chat to discuss your qualifications further. Are you available for a call tomorrow afternoon?",
        "time": "10:30 AM",
        "avatar": "https://randomuser.me/api/portraits/women/45.jpg"
      },
      {
        "isMe": true,
        "text":
        "Hi TechCorp, thank you for reaching out! I'm available tomorrow afternoon. Please let me know what time works best for you.",
        "time": "10:32 AM",
        "avatar": "https://randomuser.me/api/portraits/men/32.jpg"
      },
      {
        "isMe": false,
        "text":
        "Great! How about 2 PM EST? We can use Google Meet. I'll send you a calendar invite shortly.",
        "time": "10:33 AM",
        "avatar": "https://randomuser.me/api/portraits/women/45.jpg"
      },
      {
        "isMe": true,
        "text":
        "2 PM EST works perfectly for me. Looking forward to our conversation!",
        "time": "10:35 AM",
        "avatar": "https://randomuser.me/api/portraits/men/18.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/women/45.jpg"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("TechCorp",
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Online",
                    style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.call, color: Colors.black87),
          SizedBox(width: 16),
          Icon(Icons.videocam, color: Colors.black87),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg["isMe"] as bool;

                return Align(
                  alignment:
                  isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (!isMe)
                          CircleAvatar(
                            radius: 16,
                            backgroundImage:
                            NetworkImage(msg["avatar"] as String),
                          ),
                        if (!isMe) const SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? Colors.blue
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              msg["text"] as String,
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        if (isMe) const SizedBox(width: 8),
                        if (isMe)
                          CircleAvatar(
                            radius: 16,
                            backgroundImage:
                            NetworkImage(msg["avatar"] as String),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Message input box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
