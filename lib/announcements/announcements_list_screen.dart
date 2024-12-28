import 'package:flutter/material.dart';
import 'add_announcement_screen.dart';

class AnnouncementsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyAnnouncements = [
      {"title": "Exam Update", "description": "Exam starts at 9 AM."},
      {"title": "Holiday", "description": "College is closed tomorrow."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Announcements"),
      ),
      body: ListView.builder(
        itemCount: dummyAnnouncements.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(dummyAnnouncements[index]['title']!),
              subtitle: Text(dummyAnnouncements[index]['description']!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnnouncementScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
