import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/app/route.dart';
import 'package:futwebapp/core/color_manager.dart';
import 'package:futwebapp/services/auth.dart';
import 'package:futwebapp/services/local_storage.dart';
import 'package:futwebapp/ui/login/login_viewmodel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
String name = "";
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool setvalue = true;
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.purple,
      body: Center(
        child: FittedBox(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            width: size.width,
            height: size.height / 2 + 100,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(50.r)),
            child: Consumer<LoginViewModel>(
              builder: (context, data, __) {
                return Form(
                    key: data.key,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100.w,
                              height: 100.w,
                              child: Image.asset(
                                "asset/images/fut.jpeg",
                                fit: BoxFit.contain,
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("FutMinna Login Page",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.black)),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            controller: data.email,
                            textInputAction: TextInputAction.next,
                            cursorColor: ColorManager.purple,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                             // RegExp rexexp = RegExp(r'^M\d{7}$');
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              if (!value.contains("@")) {
                                return "Invalid Email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "School ID",
                                labelText: "School ID",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorManager.purple),
                                    borderRadius: BorderRadius.circular(50.r))),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFormField(
                            
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            cursorColor: ColorManager.purple,
                            validator: (value) {
                              name = data.email.text;
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              if(value.length < 8) {
                                return "Minimum length is 8 characters";
                              }
                    
                              return null;
                            },
                            controller: data.password,
                            obscureText: setvalue,
                            textInputAction: TextInputAction.done,
                            
                            decoration: InputDecoration(
                                hintText: "Password",
                                labelText: "Password",
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        setvalue = !setvalue;
                                      });
                                    },
                                    
                                    child: Icon(setvalue
                                        ? MdiIcons.eye
                                        : MdiIcons.eyeOffOutline)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorManager.purple),
                                    borderRadius: BorderRadius.circular(50.r)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorManager.purple),
                                    borderRadius: BorderRadius.circular(50.r))),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          MaterialButton(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r)),
                              color: ColorManager.purple,
                              minWidth: size.width - 30.w,
                              height: 60.h,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorManager.white),
                              ),
                              onPressed: () async{
                                if (data.key.currentState!.validate()) {
                                  await SharedPreferenceLocalStorage().setString("email", data.email.text);
                                   _authService.signInWithEmailAndPassword(email: data.email.text, password: data.password.text);
                                } else {
                                  //Navigator.pushReplacementNamed(
                                      //context, RouteManager.landing);
                                }
                              })
                        ],
                      ),
                    ));
              }
            ),
          ),
        ),
      ),
    );
  }
}
