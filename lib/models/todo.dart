class Todo {
  final String id;
  final String title;
  final String description;
  final bool isComplete;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isComplete: json['is_complete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_complete': isComplete,
    };
  }
}
