import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatelessWidget {
  final List<Map<String, String>> notes = [
    {"title": "DBMS Notes", "uploadedBy": "Prof. Vedant"},
    {"title": "Computer Networks Notes", "uploadedBy": "Prof. Kalyani"},
    {"title": "AI Notes", "uploadedBy": "Prof. Rajkumar"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          'Notes',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                notes[index]['title']!,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              subtitle: Text("Uploaded by: ${notes[index]['uploadedBy']}"),
              trailing: Icon(Icons.download, color: Colors.purple),
              onTap: () {
                // Handle download logic
              },
            ),
          );
        },
      ),
    );
  }
}
