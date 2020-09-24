import 'package:flutter/material.dart';

Map<String, String> getArguments(BuildContext context) {
  return Uri.base.queryParameters;
}
