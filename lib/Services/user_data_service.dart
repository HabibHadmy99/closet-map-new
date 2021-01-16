import 'package:closet_map/List/user.dart';

abstract class UserDataService {
  Future<User> signin(String email, String password);
  Future signout();
  Future newSignup({
    String name,
    String email,
    String contact,
    String address,
    String password,
    String type,
  });

  Future<User> getCurrentUser();
  Future updateUser({
    String name,
    String email,
    String contact,
    String address,
    String password,
  });
  Future<List<User>> getUserList();
  String getCurrentUsertype();
}
