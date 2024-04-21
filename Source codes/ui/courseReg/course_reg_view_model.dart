import 'package:flutter/material.dart';

class CourseRegViewModel extends ChangeNotifier {
  bool registered = false;
  List<String> registeredCourses = [];
  List<int> courseCreditUnit = [3,2,2,3,2,4,3,2,2,1];
  List<int> newcourseCreditUnit = [];
  final List _courseList = [
    ["MTH111", "GST103", "PHY111", "CHM104", "PHY113", "MTH121", "GST123", "PHY121", "CHM124", "PHY123"],
    ["MTH201", "GST203", "PHY211", "CHM204", "CSS211","MTH221", "GST223", "PHY221", "CHM224", "CSS221"],
    ["CPT314", "GST308", "CSS311", "CSS302", "CPT304", "CPT324", "GST328", "CSS321", "CSS322", "CPT324"],
    ["CSS416", "CSS412", "CSS413", "CSS418", "CSS414", "CSS426", "CSS422", "CSS423", "CSS428", "CSS424"],
    ["CSS511", "CSS503", "CSS511", "CSS504", "CSS512", "CSS521", "CSS523", "CSS521", "CSS524", "CSS522"],
  ];

  final List checked = List.filled(10, false);

  int length = 0;
  List getCourseList(String? index) {
    if (index == null) {
      return [];
    } else {
      int newIndex = int.parse(index);
      newIndex = (newIndex / 100 - 1).toInt();
      length = _courseList[newIndex].length;
      //registeredCourses.add(_courseList[newIndex]);
      return _courseList[newIndex];
    }
  }
  void onTap() {
    registered = true;
    notifyListeners();
  }

}

