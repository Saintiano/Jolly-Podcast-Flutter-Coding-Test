import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jolly_podcast_test/networks/env.dart';

class AppNetworkUrl {
  static const bool IS_APP_LIVE = false;
  static const String iOS_VERSION = "1.1.3";
  static const String ANDROID_VERSION =  "1.1.3";
  static final String baseStUrl = IS_APP_LIVE ? Env.prodBaseUrl : Env.devBaseUrl;

}
