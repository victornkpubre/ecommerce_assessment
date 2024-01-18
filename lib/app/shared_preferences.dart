import 'package:ecommerce/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USERKEY = 'user';

class AppPreferences {
  setUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(USERKEY, user.toJson());
  }

  Future<bool> localUserLogout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(USERKEY);
  }

  Future<User?> getCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userJson = sharedPreferences.getString(USERKEY);
    if (userJson != null) {
      return User.fromJson(userJson);
    } else {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(USERKEY);
  }


  

}
