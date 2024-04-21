import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/app/route.dart';
import 'package:futwebapp/services/auth.dart';
import 'package:futwebapp/ui/courseReg/course_reg_view_model.dart';
import 'package:futwebapp/ui/login/login_viewmodel.dart';
import 'package:futwebapp/ui/schoolFees/schoolFees_viewModel.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SchoolFeesViewModel()),
        ChangeNotifierProvider(create: (_) => CourseRegViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        StreamProvider<UserModel?>.value(value: AuthService().user, initialData: null),
      ],
      child: const ScreenUtilInit(
        designSize: Size(375,800),
        child:  MaterialApp(
          //navigatorKey: navigatorkey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.getRoute,
          initialRoute: RouteManager.splash,
        ),
      ),
    );
  }
}