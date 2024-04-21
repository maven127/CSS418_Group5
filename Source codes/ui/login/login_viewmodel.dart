import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futwebapp/services/auth.dart';

class LoginViewModel extends ChangeNotifier {
  late final AuthService _authService;
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController password = TextEditingController();
void start() {
    _authService = AuthService();
  }
    Future signInUser() async {
    // var connectionResult = await Connectivity().checkConnectivity();
    // if(connectionResult == ConnectivityResult.none) {
    //   print("no internet connection");
    //   notValidated();
      
    // }
    try {
      print("jfjbjsbff");
      validated();
      var result = await _authService.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      print("the result: $result");
      if (result == null) {
        notValidated();
      }
    } catch (e) {}
  }

  void validated() {
    loading = true;
    notifyListeners();
  }

  void notValidated() {
    loading = false;
    notifyListeners();
  }
}