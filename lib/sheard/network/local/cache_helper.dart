import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences sharedPreferences;

 static  init() async {

    sharedPreferences = await SharedPreferences.getInstance();         // t3rive sharedPreferences
  }
  
  
  static Future<bool> saveData({

    required String key ,
    required bool value ,
}) async {
    
    return await sharedPreferences.setBool(key, value);
  }




 static bool? getData({

    required String key ,

  })  {

    return sharedPreferences.getBool(key);
  }



}