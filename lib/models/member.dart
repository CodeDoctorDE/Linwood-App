import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/guild.dart';
import 'package:linwood_app/models/user.dart';
import 'package:linwood_app/services/api_service.dart';

class Member {
  final String id;
  final int likes;
  final int dislikes;
  final int points;
  final int guildId;
  final int invites;
  final MemberRole role;

  Member({this.invites, this.id, this.likes, this.dislikes, this.points, this.guildId, this.role});
  int get karma {
    return likes - dislikes;
  }

  Future<User> get user => GetIt.I.get<ApiService>().fetchUser(guildId);

  int get level {
    return likes;
  }

  Future<Guild> get guild => GetIt.I.get<ApiService>().fetchGuild(guildId);

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['id'],
        likes: json['likes'],
        dislikes: json['dislikes'],
        points: json['points'],
        guildId: json['guildId'],
        role: json['role'],
        invites: json['invites']);
  }
}

enum MemberRole { user, admin }
