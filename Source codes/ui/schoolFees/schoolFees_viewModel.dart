import 'package:flutter/material.dart';

class SchoolFeesViewModel with ChangeNotifier {
  String? selectedValue;
  bool paid = false;

  void setPaid() {
    paid = true;
    notifyListeners();
  }
  void onChanged(String? value) {
    selectedValue = value;
    notifyListeners();
  }
 }