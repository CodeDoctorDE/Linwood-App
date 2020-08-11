class Team {
  final String name;
  final String id;
  final Role role;
  final TeamPlan plan;
  Team({this.name, this.id, this.role, this.plan});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        name: json['name'],
        id: json['id'],
        role: json['role'],
        plan: json['plan']);
  }
}

enum TeamPlan { community, pro, private }
enum Role { member, moderator, admin, owner }
