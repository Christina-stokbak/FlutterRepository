class Task {
  String description;
  DateTime date;
  int duration;
  bool finished;
  String notes;
  DateTime get endTime {
    return date.add(Duration(hours: duration));
  }

  Task(
      {required this.description,
      required this.date,
      required this.duration,
      this.notes = "",
      this.finished = false});
  Task.WithNotes(
      {required this.description,
      required this.date,
      required this.duration,
      required this.notes,
      this.finished = false});
  factory Task.fromJson(Map<String, dynamic> json) {
    if(json['notes'] != null && json['notes'] != ""){
      return Task.WithNotes(
        description: json['description'],
        date: DateTime.parse(json['date']),
        duration: json['duration'],
        notes: json['notes'],
      );
    }
    else{
      return Task(
        description: json['description'],
        date: DateTime.parse(json['date']),
        duration: json['duration'],
      );
    }
  }
}
