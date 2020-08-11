class Karma {
  final int constant;
  Karma({this.constant});

  factory Karma.fromJson(Map<String, dynamic> json) {
    return Karma(constant: json['constant']);
  }
}
