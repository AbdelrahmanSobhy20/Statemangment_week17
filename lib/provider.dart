import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  String name = "";
  String email = "";
  String phone = "";
  String password = "";
  int quantity = 0;

  SignIn(String name , String email , String phone){
    this.name = name;
    this.email = email;
    this.phone = phone;
    notifyListeners();
  }


 inc(){
   quantity++;
   notifyListeners();
 }
  dec(){
    quantity--;
    notifyListeners();
  }
}
