import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mit_app/announcements/fetch_announcements.dart';
import 'package:mit_app/announcements/announcement_model.dart';

class AnnouncementsScreen extends StatelessWidget {
  final AnnouncementService _service = AnnouncementService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text(
            'Announcements',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _service.fetchAnnouncements(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final announcements = snapshot.data!;
              return ListView.builder(
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final announcement = announcements[index];
                  return Card(
                    child: ListTile(
                      title: Text(announcement["title"] ?? "No Title"),
                      subtitle:
                          Text(announcement["description"] ?? "No Description"),
                      trailing: Text(announcement["date"] ?? "No Date"),
                    ),
                  );
                },
              );
            }
            return Center(child: Text("No announcements found."));
          },
        ));
  }
}
