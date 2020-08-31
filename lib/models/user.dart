import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/member.dart';
import 'package:linwood_app/services/api_service.dart';

class User {
  final String id;
  final String name;
  final String descriminator;
  String get tag => name + "#" + descriminator;
  Future<Member> fetchMember(int teamId) => GetIt.I.get<ApiService>().fetchMember(id, teamId);

  User({this.id, this.name, this.descriminator});

  factory User.fromJson(Map<String, dynamic> json) {
    return User();
  }
}
