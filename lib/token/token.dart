import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class token {
  static FlutterSecureStorage storage = new FlutterSecureStorage();
  static Future<void> storeToken(token) async {
    await storage.write(key: 'jwt', value: token);
  }

  static Future<String?> readToken() async {
    await storage.read(key: 'jwt').then((value) {
      return (value);
    });
  }
}
