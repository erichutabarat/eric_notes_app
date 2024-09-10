class Note {
  final String title;
  final String category;
  final String content;

  const Note(
      {required this.title, required this.category, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'category': category,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      category: map['category'],
    );
  }
}
