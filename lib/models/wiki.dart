class Wiki {
  final String name;
  final String description;
  final int guildId;

  Wiki({this.name, this.description, this.guildId});
  factory Wiki.fromJson(Map<String, dynamic> json) {
    return Wiki(name: json['name'], description: json['descrition'], guildId: json['guildId']);
  }
}
