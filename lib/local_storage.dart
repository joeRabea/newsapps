import 'package:shared_preferences/shared_preferences.dart';

class AppLocal {
  static String Image_Key = 'Image_Key';
  static String Name_Key = 'Name_Key';
  static String IS_UPLOAD = 'IS_UPLOAD';

  // setImage
  static cacheImage(String path) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(Image_Key, path);
  }

  static Future<String> getImage() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(Image_Key) ?? '';
  }

  // setName
  static cacheName(String name) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(Name_Key, name);
  }

  static Future<String> getName() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(Name_Key) ?? '';
  }

  // isUpload
  static cacheIsUpload(bool isUpload) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool(IS_UPLOAD, isUpload);
  }

  static Future<bool> getIsUpload() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool(IS_UPLOAD) ?? false;
  }
}
