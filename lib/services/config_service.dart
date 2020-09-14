import 'package:global_configuration/global_configuration.dart';

class ConfigService {
  get config => GlobalConfiguration().get("config");
  Uri get loginLink => Uri.https(config['discord_uri'], "/api/oauth2/authorize", {
        "client_id": config["client_id"],
        "redirect_uri": config["redirect_uri"],
        "response_type": "code",
        "scope": config["scope"]
      });
  String get api => config['api'];
}
