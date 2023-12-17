import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  Future<SharedPreferences> get _getInstance => SharedPreferences.getInstance();

  setTheme(bool isWhite) async {
    SharedPreferences instance = await _getInstance;
    instance.setBool("THEME", isWhite);
  }

  getTheme() async {
    SharedPreferences instance = await _getInstance;
    bool isWhite = instance.getBool("THEME") ?? true;
    return isWhite;
  }

}