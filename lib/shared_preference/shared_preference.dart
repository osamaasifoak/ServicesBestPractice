import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServiceClass {
  SharedPreferences _sharedPreferences;

  addStringInSF(String key, String value) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(key, value);
  }

  Future<String> getStringInSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key);
    return stringValue;
  }
}
