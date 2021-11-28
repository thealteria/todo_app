class Todo {
  String? title;
  int? duration;
  int? status;
  //0 - finished, 1 - started, 2 - pause
  String? description;

  Todo({
    this.title,
    this.duration,
    this.description,
    this.status,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    duration = json['duration'];
    status = json['status'] ?? 1;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

enum TodoStatus {
  finished,
  ongoing,
  pause,
}
