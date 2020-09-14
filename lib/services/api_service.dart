import 'package:get_it/get_it.dart';
import 'package:linwood_app/models/guild.dart';
import 'package:linwood_app/models/wiki.dart';
import 'package:linwood_app/models/wiki_element.dart';
import 'package:http/http.dart' as http;

import 'config_service.dart';

class ApiService {
  Future<dynamic> fetchInfo() async {
    var response = await http.get(Uri.https(GetIt.I.get<ConfigService>().api, "/").toString());
    return response;
  }

  Future<Guild> fetchGuild(int id) async {
    var guilds = await fetchGuilds();
    return guilds[id];
  }

  fetchUser(int guildId) {
    return Future.delayed(Duration(seconds: 1), () => Guild());
  }

  fetchMember(int memberId, int guildId) {}
  Future<List<Guild>> fetchGuilds() async {
    return Future.delayed(
        Duration(seconds: 1),
        () => [
              Guild(
                  id: "735424757142519848",
                  name: "Linwood",
                  added: false,
                  prefixes: ["+linwood", "+lw"],
                  icon:
                      "https://cdn.discordapp.com/icons/735424757142519848/df07e8d896578e4e73cfc5e111ea59c7.png"),
              Guild(
                  id: "735424757142519848",
                  name: "another server...",
                  added: true,
                  icon:
                      "https://cdn.discordapp.com/icons/735424757142519848/df07e8d896578e4e73cfc5e111ea59c7.png")
            ]);
  }

  Future<List<Wiki>> fetchWikis() {
    return Future.delayed(Duration(seconds: 1),
        () => [Wiki(name: "Example wiki", description: "This is a description of a wiki")]);
  }

  Future<Wiki> fetchWiki(int id) async {
    var wikis = await fetchWikis();
    return wikis[id];
  }

  Future<List<WikiElement>> fetchWikiElements() {
    return Future.delayed(
        Duration(seconds: 1), () => [WikiElement(title: "Test", body: "hi :D", path: "Test/")]);
  }
}
