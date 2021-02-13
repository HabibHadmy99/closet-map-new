import 'package:closet_map/Services/dataservice.dart';
import 'package:closet_map/Services/user_data_service.dart';
import 'package:closet_map/screen/viewmodel.dart';

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
      name: 'Jasmin Fareena',
      email: 'jasmin@gmail.com',
      contact: '012984178',
      password: '12345678',
      address: 'Ampang, Selangor',
      type: 'user'),
  User(
      name: 'Haris Hashemeen',
      email: 'haris@gmail.com',
      contact: '0123412313',
      password: '12345678',
      address: 'Kg Iskandar, Taman FamilyMart, Kelantan ',
      type: 'admin'),
  User(
      name: 'Mirhanieza',
      email: 'mir@gmail.com',
      contact: '0123412313',
      password: '12345678',
      address: 'Johor ',
      type: 'admin'),
];

class UserDataServiceMock implements UserDataService {
  User current;

  Future signout() async {
    current = null;
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
        type: type);

    final json = await dataService.post('user', data: newUser);
    return User.fromJson(json);
  }

  Future<User> getCurrentUser() async {
    return current;
  }

  Future setCurrentUser({User curr}) async {
    current = curr;
  }

  String getCurrentUsertype() {
    return current.type;
  }

  String getUserID() {
    return current.id;
  }

  Future updateUser({
    String name,
    String email,
    String contact,
    String address,
    String password,
    String id,
  }) async {
    if (name == null) {
      name = current.name;
    }
    if (email == null) {
      email = current.email;
    }
    if (contact == null) {
      contact = current.contact;
    }
    if (address == null) {
      address = current.address;
    }
    if (password == null) {
      password = current.password;
    }
    final json = await dataService.patch('user/$id', data: {
      'name': name,
      'email': email,
      'contact': contact,
      'address': address,
      'password': password
    });
    return User.fromJson(json);

    /*current.name = name;
    current.contact = contact;
    current.email = email;
    current.address = address;
    current.password = password;*/
  }

  Future<List<User>> getUserList() async {
    final listJson = await dataService.get('user');
    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
    /* List<User> user = new List<User>();
    print(globalUserList.length);

    for (int i = 0; i < globalUserList.length; i++)
      if (globalUserList[i].type == 'user') user.add(globalUserList[i]);

    return user;*/
  }

  Future<User> signin(String email, String password) async {
    List<User> userlist = await getUserList();
    for (var user in userlist) {
      if (email == user.email && password == user.password) {
        current = user;
        return Future.value(user);
      }
    }
    return null;
  }
}
