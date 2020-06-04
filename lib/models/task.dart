class Task {
  final String title;
  final String description;

  Task({this.title, this.description});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(title: json["title"], description: json["description"]);
  }
}
