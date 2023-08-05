import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  // Keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailInKey = "USEREMAILKEY";


  // Saving the data to SF

  //   geting the data from SF
  static Future<bool?> getUserLoggedInStatus() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
}