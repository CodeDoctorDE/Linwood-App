import 'package:global_configuration/global_configuration.dart';

class ConfigService {
  get config => GlobalConfiguration().get("config");
  get loginLink => Uri.https(config['discord_uri'], config['discord_path'], {
        "client_id": config["client_id"],
        "redirect_uri": config["redirect_uri"],
        "response_type": "code",
        "scope": config["scope"]
      });
}
