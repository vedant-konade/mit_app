class Announcement {
  final String id;
  final String title;
  final String description;
  final String date;
  final String category;
  final bool isImportant;

  Announcement({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.category,
    required this.isImportant,
  });

  factory Announcement.fromJson(String id, Map<String, dynamic> json) {
    return Announcement(
      id: id,
      title: json['title'],
      description: json['description'],
      date: json['date'],
      category: json['category'],
      isImportant: json['isImportant'] ?? false,
    );
  }
}
