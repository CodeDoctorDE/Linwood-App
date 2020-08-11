import 'package:linwood/services/guild.dart';

class Member {
  final String name;
  final String tag;
  final String id;
  final String icon;
  int likes;
  int dislikes;
  int points;
  int guildId;
  MemberRole role;

  Member(
      {this.name,
      this.tag,
      this.id,
      this.icon,
      this.likes,
      this.dislikes,
      this.points,
      this.guildId,
      this.role});
  int get karma {
    return likes - dislikes;
  }

  int get level {
    return likes;
  }

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        name: json['name'],
        id: json['id'],
        icon: json['icon'],
        likes: json['likes'],
        dislikes: json['dislikes'],
        points: json['points'],
        role: json['role']);
  }
}

enum MemberRole { user, admin }
