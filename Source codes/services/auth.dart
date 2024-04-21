import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
String? uid = "";
class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  UserModel? _userfromFirebase(User? user) {
    uid = user?.uid;
    notifyListeners();
    return user != null ? UserModel(uid: user.uid) : null;
  }


  Stream<UserModel?> get user => _auth.userChanges().map(_userfromFirebase);

  //sign in with email and password
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userfromFirebase(userCredential.user);
    } catch (e) {
      print(e.toString());

    } 
  }

  //register with email and password
  // Future registerWithEmailAndPassword(
  //     {required String email,
  //     required String password,
  //     required String name,
  //     required String phoneNumber,
  //     required String? type}) async {
  //   try {
  //     UserCredential userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);
  //     DataBaseService(userCredential.user!.uid)
  //         .updateUser(name: name, phoneNumber: phoneNumber, type: type);
  //     return _userfromFirebase(userCredential.user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  //sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

}


class UserModel {
  final String? uid;

  UserModel({required this.uid});
  
}