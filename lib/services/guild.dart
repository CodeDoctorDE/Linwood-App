class Guild {
  final String name;
  final String id;
  final String icon;
  final bool added;
  Guild({this.name, this.id, this.icon, this.added});

  factory Guild.fromJson(Map<String, dynamic> json) {
    return Guild(
        name: json['name'],
        id: json['id'],
        icon: json['icon'],
        added: json['added']);
  }
}
