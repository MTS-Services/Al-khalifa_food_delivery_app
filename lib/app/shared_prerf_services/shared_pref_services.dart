import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices{

  static String userEmail='';
  static String userOtp='';
  static String? userToken = '';


  static Future<void> saveUserEmail(String email)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString("user_email", email);
    final saveEmail=await getUserEmail();
    userEmail=email;
  }
  static Future<String?> getUserEmail()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final memory=prefs.getString("user_email");
    return memory;

  }

  static Future<void> saveUserOtp(String otp)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString("user_otp", otp);
    final saveOtp=await getUserOtp();
    userOtp=otp;
    print("saveOtp \\\\ $saveOtp");
  }
  static Future<String?> getUserOtp()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final checkOtp=prefs.getString("user_otp");
    return checkOtp;

  }

  static Future<void> saveUserToken(String token)async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString("user_token", token);
    userToken=token;
  }
  static Future<void> getUserToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken = prefs.getString("user_token");
  }

  static Future<void> clear()async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static bool get isLoggedIn{
    return userToken != null;
  }

}


