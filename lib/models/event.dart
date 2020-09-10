import 'package:enum_to_string/enum_to_string.dart';

class Event {
  final String name;
  final String description;
  final DateTime deadline;
  final int minMembers;
  final int maxMembers;
  final int minWinningMembers;
  final int maxWinningMembers;
  final String requiredRoleId;
  final EventStrategy strategy;

  Event(
      {this.name,
      this.description,
      this.deadline,
      this.minMembers,
      this.maxMembers,
      this.requiredRoleId,
      this.strategy,
      this.minWinningMembers,
      this.maxWinningMembers});
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        deadline: DateTime.parse(json['deadline']),
        description: json['description'],
        minMembers: json['minMembers'],
        maxMembers: json['maxMembers'],
        minWinningMembers: json['minWinningMembers'],
        maxWinningMembers: json['maxWinningMembers'],
        name: json['name'],
        requiredRoleId: json['requiredRoleId'],
        strategy: EnumToString.fromString(
            EventStrategy.values, (json['strategy'] as String).toLowerCase()));
  }
}

enum EventStrategy { random, first }
