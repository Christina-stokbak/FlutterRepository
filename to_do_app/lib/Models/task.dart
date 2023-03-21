class Task {
  String description;
  DateTime date;
  int duration;
  bool finished;
  DateTime get endTime{
    return date.add(Duration(hours: duration));
  }

  Task(
      {required this.description,
      required this.date,
      required this.duration,
      this.finished = false});
}