import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/member.dart';
import 'package:linwood_app/services/api_service.dart';

class Birthday {
  final int memberId;
  final int guildId;
  final DateTime date;
  final String description;
  final String message;
  Birthday({this.memberId, this.guildId, this.date, this.description, this.message});
  factory Birthday.fromJson(Map<String, dynamic> json) {
    return Birthday(
        date: DateTime.parse(json['date']),
        memberId: json['memberId'],
        guildId: json['guildId'],
        description: json['description'],
        message: json['message']);
  }

  Future<Member> fetchMember() => GetIt.I.get<ApiService>().fetchMember(memberId, guildId);
}
