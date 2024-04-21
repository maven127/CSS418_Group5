import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLocalStorage {
  static SharedPreferenceLocalStorage? _instance;
  static SharedPreferences? _preferences;

  getInstance() async{
    _instance ??= SharedPreferenceLocalStorage();
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future setString(String key, String value) async => await _preferences?.setString(key, value);
  
  Future setBool(String key, bool value) async => await _preferences?.setBool(key, value);

  String? getString(String key)  => _preferences?.getString(key);
  
  bool? getBool(String key) => _preferences?.getBool(key);

  Future<bool?> clearStorage() async => _preferences?.clear();
}