class NoteModel {
  String? id;
  String? title;
  String? content;
  DateTime? time;
  DateTime? dateCreated;
  DateTime? dateModified;
  int? color;
  bool? isCompleted;

  NoteModel({
    this.id,
    this.title,
    this.content,
    this.time,
    this.dateCreated,
    this.dateModified,
    this.color,
    this.isCompleted,
  });

  // toMap
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'time': time.toString(),
      'dateCreated': dateCreated.toString(),
      'dateModified': dateModified.toString(),
      'color': color,
      'isCompleted': isCompleted,
    };
  }

  // fromMap
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      time: DateTime.parse(json['time']),
      dateCreated: DateTime.parse(json['dateCreated']),
      dateModified: DateTime.parse(json['dateModified']),
      color: json['color'],
      isCompleted: json['isCompleted'],
    );
  }
}
