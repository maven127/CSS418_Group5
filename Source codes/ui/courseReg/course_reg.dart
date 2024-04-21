import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/core/color_manager.dart';
import 'package:futwebapp/services/auth.dart';
import 'package:futwebapp/services/db.dart';
import 'package:futwebapp/services/local_storage.dart';
import 'package:futwebapp/ui/courseReg/course_reg_view_model.dart';
import 'package:futwebapp/ui/schoolFees/schoolFees_viewModel.dart';
import 'package:provider/provider.dart';

class CourseRegScreen extends StatefulWidget {
  const CourseRegScreen({super.key});

  @override
  State<CourseRegScreen> createState() => _CourseRegScreenState();
}

class _CourseRegScreenState extends State<CourseRegScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel?>(context) == null
        ? ""
        : Provider.of<UserModel?>(context)!.uid;
    print(user);
    String? level = context.read<SchoolFeesViewModel>().selectedValue;
    bool paid = context.read<SchoolFeesViewModel>().paid;
    return Scaffold(
      backgroundColor: ColorManager.mischka.withOpacity(.9),
      body: Consumer<CourseRegViewModel>(builder: (context, course, __) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Text(
                    "Welcome to the course registration portal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.black),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                    child: Text(
                      "The courses available are only for your level, kindly select:",
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.black),
                    ),
                  ),
                ),
                Column(
                    children: paid
                        ? List.generate(
                            course.getCourseList(level).length,
                            (index) => CheckboxListTile(
                                title: Text(
                                    "${course.getCourseList(level)[index]} (${course.courseCreditUnit[index]} Unit)"),
                                value: course.checked[index],
                                onChanged: (value) {
                                  setState(() {
                                    course.checked[index] = value;
                                    if (course.checked[index] == true) {
                                      course.registeredCourses.add(
                                          course.getCourseList(level)[index]);
                                      course.newcourseCreditUnit
                                          .add(course.courseCreditUnit[index]);
                                    } else {
                                      course.registeredCourses.removeAt(index);
                                      course.newcourseCreditUnit.removeAt(
                                          course.courseCreditUnit[index]);
                                    }
                                  });
                                }))
                        : []),
                SizedBox(
                  height: 30.h,
                ),
                //pay button
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.r),
                    child: MaterialButton(
                        color: ColorManager.purple,
                        minWidth: 100.w,
                        height: 70.h,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r)),
                        onPressed: course.checked[0] == false
                            ? () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 70.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: ColorManager.purple,
                                        child: Center(
                                          child: Text(
                                              level == null
                                                  ? "Kindly pay your school fees before you register."
                                                  : "Kindly select a course",
                                              style: TextStyle(
                                                  color: ColorManager.white,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      );
                                    });
                              }
                            : () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 6.h),
                                        title: const Text(
                                            "Kindly confirm the courses"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              course.registeredCourses.length,
                                              (index) => Text(course
                                                  .registeredCourses[index])),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                course.onTap();
                                                SharedPreferenceLocalStorage().setBool("registered", course.registered);
                                                DataBaseService(uid).addCourse(
                                                    courses: course
                                                        .registeredCourses);
                                                Navigator.of(context).pop();
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        height: 70.h,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        color:
                                                            ColorManager.purple,
                                                        child: Center(
                                                          child: Text(
                                                              "Successfully Registered...",
                                                              style: TextStyle(
                                                                  color:
                                                                      ColorManager
                                                                          .white,
                                                                  fontSize:
                                                                      22.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: const Text("Yes")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("No")),
                                        ],
                                      );
                                    });
                              },
                        child: Text(
                          "Register Courses",
                          style: TextStyle(
                              color: ColorManager.white, fontSize: 20.sp),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
