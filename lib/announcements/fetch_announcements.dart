import 'package:firebase_database/firebase_database.dart';
import 'announcement_model.dart';

class AnnouncementService {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref('announcements');

  Future<List<Map<String, dynamic>>> fetchAnnouncements() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('announcements');

    final snapshot = await ref.get();
    if (snapshot.exists) {
      // Cast the fetched data explicitly
      Map<String, dynamic> data =
          Map<String, dynamic>.from(snapshot.value as Map);
      return data.entries.map((e) {
        return {
          "title": e.value["title"],
          "description": e.value["description"],
          "date": e.value["date"]
        };
      }).toList();
    } else {
      return [];
    }
  }
}
