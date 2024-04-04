import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning/common/values/constants.dart';

class StorageService {
  static SharedPreferences? _prefs;
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setBool(String key, bool value) async {
    _prefs = await SharedPreferences.getInstance();
    print("dwdjhebdjhe-----$value");
    return await _prefs!.setBool(key, value) ?? false;
  }

  Future<bool> setString(String key, String value) async {
    _prefs = await SharedPreferences.getInstance();
    print("string-----$value");
    return await _prefs!.setString(key, value);
  }

  bool? getDeviceFirstOpen() {
    return _prefs!.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  bool? isLoggedIn() {
    return _prefs!.getString(AppConstants.STORAGE_USER_KEY) == null
        ? false
        : true;
  }
}
