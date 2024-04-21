import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
   String? uid;
  final CollectionReference _user = FirebaseFirestore.instance.collection("courses");

  DataBaseService(this.uid);

  

  Future addCourse({required List<String> courses}) async {
    try {
      await _user.doc(uid).collection("meals").doc(uid).set({
        "courses": courses,
        //"unit": unit
      });
    } catch (e) {
      print("not created");
    }
  } 
  


  Stream<DocumentSnapshot> get getUserData => _user.doc(uid).collection("meals").doc(uid).snapshots();
}


class UserObject {
  final List<dynamic> courses;
  //final List<int> unit;

  UserObject({required this.courses});

  factory UserObject.fromJson(Map<String, dynamic>? json) {
    return UserObject(
      courses: json!['courses'] ?? [],
      //unit: json['unit'],
    );
  } 
}