import 'package:get_it/get_it.dart';
import 'package:linwood/services/guild.dart';

import 'api_service.dart';

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

  Future<Guild> get guild => GetIt.I.get<ApiService>().fetchGuild(guildId);

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        name: json['name'],
        id: json['id'],
        icon: json['icon'],
        likes: json['likes'],
        dislikes: json['dislikes'],
        points: json['points'],
        guildId: json['guildId'],
        role: json['role']);
  }
}

enum MemberRole { user, admin }
