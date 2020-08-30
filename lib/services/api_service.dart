import 'package:linwood_app/models/guild.dart';

class ApiService {
  Future<Guild> fetchGuild(int index) {
    return Future.delayed(new Duration(seconds: 5), () => Guild());
  }
}
