import 'package:movie_app/core/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper
{
  static CashHelper? _instance;
  static SharedPreferences? _preferences;
  CashHelper._();
  static Future<CashHelper> getInstance()async
  {
    if(_instance==null)
    {
      await _getPreferences();
      _instance=CashHelper._();
    }
    return _instance!;
  }
  static Future<void> _getPreferences()async
  {
    _preferences=await SharedPreferences.getInstance();
  }

  saveBool(String key,bool value)
  {
    _preferences!.setBool(key, value);
  }
 bool? getSavedBool(String key)
  {
    return _preferences!.getBool(key);
  }
  clearKey(String key)
  {
    _preferences!.remove(key);
  }
}