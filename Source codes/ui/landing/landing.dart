import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/app/route.dart';
import 'package:futwebapp/core/color_manager.dart';
import 'package:futwebapp/services/auth.dart';
import 'package:futwebapp/services/db.dart';
import 'package:futwebapp/services/local_storage.dart';
import 'package:futwebapp/ui/courseReg/course_reg_view_model.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    String? name = SharedPreferenceLocalStorage().getString("email");
    bool? paid1 = SharedPreferenceLocalStorage().getBool("paid");
    bool? registered1 = SharedPreferenceLocalStorage().getBool("registered");
    List<int> courseCreditUnit =
        context.watch<CourseRegViewModel>().courseCreditUnit;
    List titles = ["ID", "Course Title", "Credit Unit"];
    int sumOfCredit = 0;
    return Scaffold(
      backgroundColor: ColorManager.mischka.withOpacity(.9),
      drawer: Drawer(
        backgroundColor: ColorManager.purple,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: ColorManager.purple,
                    image: const DecorationImage(
                        fit: BoxFit.fill, 
                        image: AssetImage("asset/images/Futminna_logo 2.jpg"))),
                child: null),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteManager.schoolFees);
              },
              title: Text(
                "Pay School fees",
                style: TextStyle(fontSize: 18.sp, color: ColorManager.white),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteManager.courseReg);
              },
              title: Text(
                "Course Registration",
                style: TextStyle(fontSize: 18.sp, color: ColorManager.white),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                auth.signout();
              },
              title: Text(
                "Log Out",
                style: TextStyle(fontSize: 18.sp, color: ColorManager.white),
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                SharedPreferenceLocalStorage().clearStorage();
              },
              title: Text(
                "Clear Storage",
                style: TextStyle(fontSize: 18.sp, color: ColorManager.white),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorManager.purple,
        title: Text(
          "DASHBOARD",
          style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
              color: ColorManager.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorManager.mable,
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  "Welcome back, $name",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.bermudaGray),
                ),
              ),
            ),
            Row(
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: 200,
                    ),
                    duration: const Duration(seconds: 1),
                    builder: (context, size, __) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.r, vertical: 10.r),
                            color: Colors.red.shade100,
                            height: size.h,
                            child: Center(
                                child: Text(
                              "Acceptance Fee\n Yes",
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      );
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: 200,
                    ),
                    duration: const Duration(seconds: 1),
                    builder: (context, size, __) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.r, vertical: 10.r),
                            color: Colors.greenAccent.shade100,
                            height: size.h,
                            child: Center( 
                                child: Text(
                                    paid1 == null || paid1 == false
                                        ? "Registration Fee\n No"
                                        : "Registration Fee\n Yes",
                                    style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center)),
                          ),
                        ),
                      );
                    }),
              ],
            ),
            Row(
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: 200,
                    ),
                    duration: const Duration(seconds: 1),
                    builder: (context, size, __) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.r, vertical: 10.r),
                            color: Colors.lightBlue.shade100,
                            height: size.h,
                            child: Center(
                                child: Text("Accommodation Fee\n Yes",
                                    style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center)),
                          ),
                        ),
                      );
                    }),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 0,
                      end: 200,
                    ),
                    duration: const Duration(seconds: 1),
                    builder: (context, size, __) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.r, vertical: 10.r),
                            color: Colors.orangeAccent.shade100,
                            height: size.h,
                            child: Center(
                                child: Text(
                                    registered1 == null || registered1 == false
                                        ? "Registration Status\n No"
                                        : "Registration Status\n Yes",
                                    style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center)),
                          ),
                        ),
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Registered courses (First and Second Semester)",
                textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            StreamBuilder<DocumentSnapshot>(
                  stream: DataBaseService(uid).getUserData,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      print(snapshot.data!.data());
                      UserObject _user = UserObject.fromJson(snapshot.data!.data() as Map<String, dynamic>);
                      print(_user);
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        width: double.maxFinite,
                        child: DataTable(
                          columns: List.generate(
                              3, (index) => DataColumn(label: Text(titles[index]))),
                          rows: _user.courses.isEmpty ? [] : List.generate(_user.courses.length, (indexp) {
                            return DataRow(cells: [
                              DataCell(Text("${indexp + 1}")),
                              DataCell(Text(_user.courses[indexp])),
                              DataCell(Text(courseCreditUnit[indexp].toString())),
                            ]);
                          }),
                        ),
                      );
                    }
                    else {
                      return Text("Loading");
                    }
                    
                  }
                ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Divider(
                thickness: 1.5,
                color: ColorManager.bermudaGray,
              ),
            ),
            // Center(
            //   child: Text("Total Course Credit Units:  $sumOfCredit"),
            // ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
