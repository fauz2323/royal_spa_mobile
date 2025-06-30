import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenUtils {
  static const String _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: _tokenKey);
  }

  static Future<void> deleteAllTokens() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
