
import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorage {
  static final _prefs = SharedPreferences.getInstance();

  static Future<String> getUsername() async {
    final prefs = await _prefs;
    return prefs.getString('username') ?? '';
  }

  static Future<String> getEmail() async {
    final prefs = await _prefs;
    return prefs.getString('email') ?? '';
  }

  static Future<String> getPassword() async {
    final prefs = await _prefs;
    return prefs.getString('password') ?? '';
  }

  static Future<void> setUsername(String username) async {
    final prefs = await _prefs;
    prefs.setString('username', username);
  }

  static Future<void> setEmail(String email) async {
    final prefs = await _prefs;
    prefs.setString('email', email);
  }

  static Future<void> setPassword(String password) async {
    final prefs = await _prefs;
    prefs.setString('password', password);
  }

  static Future<void> clearCredentials() async {
    final prefs = await _prefs;
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('password');
  }
}
