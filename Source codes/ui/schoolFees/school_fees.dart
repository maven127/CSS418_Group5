import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futwebapp/core/color_manager.dart';
import 'package:futwebapp/services/local_storage.dart';
import 'package:futwebapp/ui/schoolFees/schoolFees_viewModel.dart';
import 'package:provider/provider.dart';

class SchoolFeesScreen extends StatefulWidget {
  const SchoolFeesScreen({super.key});

  @override
  State<SchoolFeesScreen> createState() => _SchoolFeesScreenState();
}

class _SchoolFeesScreenState extends State<SchoolFeesScreen> {
  @override
  Widget build(BuildContext context) {
   // SharedPreferenceLocalStorage().setBool("paid", false);
    bool? paid1 = SharedPreferenceLocalStorage().getBool("paid");
    print(paid1);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.mischka.withOpacity(.9),
        body: Consumer<SchoolFeesViewModel>(builder: (context, value, __) {
          return paid1 != null || paid1 == true ? Center(child: Text("paid"),) : Column(
            //text
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Welcome to the payment portal",
                style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.black),
              ),
              Text(
                "Kindly select your level:",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              //select level
              Wrap(
                children: [
                  RadioListTile(
                      title: Text(
                        "100 Level",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      value: "100",
                      groupValue: value.selectedValue,
                      onChanged: value.onChanged),
                  RadioListTile(
                      title: Text(
                        "200 Level",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      value: "200",
                      groupValue: value.selectedValue,
                      onChanged: value.onChanged),
                  RadioListTile(
                      title: Text(
                        "300 Level",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      value: "300",
                      groupValue: value.selectedValue,
                      onChanged: value.onChanged),
                  RadioListTile(
                      title: Text(
                        "400 Level",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      value: "400",
                      groupValue: value.selectedValue,
                      onChanged: value.onChanged),
                  RadioListTile(
                      title: Text(
                        "500 Level",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      value: "500",
                      groupValue: value.selectedValue,
                      onChanged: value.onChanged),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              //pay button
              MaterialButton(
                  color: ColorManager.purple,
                  minWidth: 100.w,
                  height: 70.h,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r)),
                  onPressed: value.selectedValue == null
                      ? () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 70.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: ColorManager.purple,
                                  child: Center(
                                    child: Text(
                                        "Kindly select your level...",
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 20.sp,
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
                                  title: const Text(
                                      "Ongoing Payment"),
                                      content: Text("Amount: \nN40,061.00", style: TextStyle(
                                            color: ColorManager.black,
                                            fontSize: 26.sp,
                                            fontWeight: FontWeight.w500)),
                                  actions: [
                                    TextButton(
                                        onPressed: (){
                                          value.setPaid();
                                          value.paid == true ?
                                          SharedPreferenceLocalStorage().setBool("paid", value.paid) : 
                                          SharedPreferenceLocalStorage().setBool("paid", false);


                                          Navigator.of(context).pop();
                                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 70.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: ColorManager.purple,
                                  child: Center(
                                    child: Text(
                                        "Successfully paid...",
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: 26.sp,
                                            fontWeight: FontWeight.w500)),
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
                    "Pay School Fees",
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          );
        }),
      ),
    );
  }
}
