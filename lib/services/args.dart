import 'package:flutter/material.dart';

import 'args_io.dart' as impl if (dart.library.html) 'args_web.dart';

class ArgumentsFetcher {
  static Map<String, String> getArguments(BuildContext context) {
    return impl.getArguments(context);
  }
}
