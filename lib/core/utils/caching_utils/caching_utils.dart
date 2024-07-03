import 'package:shared_preferences/shared_preferences.dart';

class CachingUtils  {
  static late SharedPreferences _prefs;
  static const String _keyProfileImage = 'profile_image';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> cacheUser(Map<String, dynamic> data) async {
    await _prefs.setString('access_token', data['access_token']);
    await _prefs.setString('token_type', data['token_type']);
    await _prefs.setInt('user_id', data['user_id']);

  }
    static Future<void> cacheEmail(String email) async {
    await _prefs.setString('email', email);
  }
   static Future<void> cacheName(String fullName) async {
    await _prefs.setString('full_name', fullName);
  }

  
  static Future<void> setProfileImagePath(String path) async {
   
    await _prefs.setString(_keyProfileImage, path);
  }

  
  static Future<void> deleteUser() async {
    await _prefs.remove('access_token');
    await _prefs.remove('token_type');
    await _prefs.remove('user_id');
  }

  static bool get isLogged {
    return _prefs.containsKey('access_token');
  }
    static int get userID {
    return _prefs.getInt('user_id') ?? 0;
  }

  static String get token {
    return _prefs.getString('access_token') ?? '';
  }
  static String get tokenType {
    return _prefs.getString('token_type') ?? '';
  }
    static String get email {
    return _prefs.getString('email') ?? '';
  }

  static String get name {
    return _prefs.getString('full_name') ?? '';
  }
  
    static String? getProfileImage() {
    return _prefs.getString('profile_image');
  }
   
    static Future<String?> getProfileImagePath() async {
 
    return _prefs.getString(_keyProfileImage);
  }

}
