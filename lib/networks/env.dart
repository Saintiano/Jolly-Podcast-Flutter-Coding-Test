import 'package:envied/envied.dart';

part 'env.g.dart'; // Make sure this line exists!

@Envied(path: '.env', obfuscate: true)
abstract class Env {

  @EnviedField(varName: 'BASE_DEV_URL')
  static String devBaseUrl = _Env.devBaseUrl;
  @EnviedField(varName: 'BASE_PROD_URL')
  static String prodBaseUrl = _Env.prodBaseUrl;


}
