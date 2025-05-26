import 'package:shared_preferences/shared_preferences.dart';

class CashHelper
{
  static CashHelper? _instance;
  static SharedPreferences? _preferences;
  CashHelper._();
  static CashHelper getInstance()
  {
    if(_instance==null)
    {
      _getPreferences();
      _instance=CashHelper._();
    }
    return _instance!;
  }
  static _getPreferences()async
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
}