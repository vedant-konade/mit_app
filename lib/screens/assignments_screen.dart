import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          'Assignments',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload Your Assignment",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle file upload
              },
              icon: Icon(Icons.upload_file),
              label: Text("Choose File"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[900],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Comments (Optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit assignment
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
