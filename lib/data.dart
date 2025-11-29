import 'package:get_storage/get_storage.dart';
import 'package:jolly_podcast_test/models/auth/auth_model.dart';

class InternalStorageDB {
  static final _localStorage = GetStorage();
  static const _token = "token";
  static const _user = "user";
  static Future authKey(String token) async {
    try {
      await _localStorage.write(_token, token);
      // await LocalStorageManager.setString(key: _banksList, value: jsonEncode(banks.toString()));
    } catch (e) {
      rethrow;
    }
  }

  static String? getAuthKey() {
    try {
      final data = _localStorage.read(_token);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static deleteAuthKey() {
    try {
      final data = _localStorage.remove(_token);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future addUserDetails(AuthModel_Data user) async {
    try {
      await _localStorage.write(_user, user);
    } catch (e) {
      rethrow;
    }
  }

  static AuthModel_Data? getUserDetails() {
    try {
      final data = _localStorage.read(_user);
      if (data != null) {
        if (data.runtimeType == AuthModel_Data) {
          return data;
        } else {
          return AuthModel_Data.fromJson(data);
        }
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

}