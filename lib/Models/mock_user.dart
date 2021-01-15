import 'package:closet_map/Services/user_data_service.dart';

import '../List/user.dart';

List globalUserList = [
  User(
      name: 'Habib Hadmy',
      email: 'habib@gmail.com',
      contact: '012345678',
      password: '12345678',
      address: 'Kg Parit Mahang, Jeram, Selangor',
      type: 'user'),
  User(
      name: 'Haris Hashemeen',
      email: 'haris@gmail.com',
      contact: '0123412313',
      password: '12345678',
      address: 'Kg Iskandar, Taman FamilyMart, Kelantan ',
      type: 'admin'),
];

class UserDataServiceMock implements UserDataService {
  User current;
  User currentUser;
  User currentName;

  Future signout() async {
    currentUser = null;
  }

  Future newSignup({
    String name,
    String email,
    String contact,
    String address,
    String password,
    String type,
  }) async {
    final newUser = User(
        name: name,
        email: email,
        contact: contact,
        address: address,
        password: password,
        type: 'user');
    globalUserList.add(newUser);
  }

  Future<User> getCurrentUserName() async {
    return currentName;
  }

  Future<User> getCurrentUser() async {
    return currentUser;
  }

  Future updateUser({
    String name,
    String email,
    String contact,
    String address,
    String password,
  }) async {
    if (name == null ||
        email == null ||
        contact == null ||
        address == null ||
        password == null) {
      name = current.name;
      email = current.email;
      contact = current.contact;
      address = current.address;
      password = current.password;
    }
    current.name = name;
    current.email = email;
    current.contact = contact;
    current.address = address;
    current.password = password;
  }

  Future<List<User>> getUserList() async {
    List<User> user = new List<User>();
    print(globalUserList.length);

    for (int i = 0; i < globalUserList.length; i++)
      if (globalUserList[i].type == 'user') user.add(globalUserList[i]);

    return user;
  }

  @override
  Future<User> signin(String email, String password) async {
    for (var user in globalUserList) {
      if (email == user.email && password == user.password) {
        currentName = user.name;
        current = user;
        return Future.value(user);
      }
    }
    return null;
  }
}
