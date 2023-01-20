import 'package:flutter/cupertino.dart';
import 'package:my_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    email: "",
    name: "",
    password: "",
    address: "",
    type: "",
    token: "",
    cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
