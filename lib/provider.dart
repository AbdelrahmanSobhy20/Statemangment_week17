import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Data extends ChangeNotifier {
  String name = "";
  String email = "";
  String phone = "";
  String password = "";
  int quantity = 0;
  bool value = false;
  Icon passicon = Icon(Icons.visibility_off);

  SignIn(String name, String email, String phone) {
    this.name = name;
    this.email = email;
    this.phone = phone;
    notifyListeners();
  }

  check() {
    value = !value;
    notifyListeners();
  }

  inc() {
    quantity++;
    notifyListeners();
  }

  dec() {
    quantity--;
    notifyListeners();
  }

  viewPassword(bool cheched) {
    if (cheched == true) {
      passicon = Icon(Icons.visibility);
    } else {
      passicon = Icon(Icons.visibility_off);
    }
    notifyListeners();
  }
}
