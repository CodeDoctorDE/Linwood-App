class Birthday {
  final String userId;
  final DateTime date;
  final String description;
  final String message;
  Birthday({this.userId, this.date, this.description, this.message});
  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
        date: DateTime.parse(json['date']),
        userId: json['userId'],
        description: json['description'],
        message: json['message']);
  }
}
