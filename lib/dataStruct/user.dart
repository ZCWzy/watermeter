import 'package:shared_preferences/shared_preferences.dart';

/// "idsAccount" "idsPassword" "sportPassword"
Map<String,String?> user = {
  "idsAccount": null,
  "idsPassword": null,
  "sportPassword": null,
};

Future<void> initUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  user["idsAccount"] = prefs.getString("idsAccount");
  user["idsPassword"] = prefs.getString("idsPassword");
  /// Temporary solution.
  user["sportPassword"] = prefs.getString("sportPassword");
  if (user.values.contains(null)){
    throw "有未注册用户，跳转至登录界面";
  }
}

Future<void> addUser(String key, String value) async {
  user[key] = value;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}