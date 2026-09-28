import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/core/main_button.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/gen/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? photo;
  Future<void> pickImageFromGamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future<void> pickImageFromGallory() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == "en") {
                      context.setLocale(Locale('ar'));
                    } else {
                      context.setLocale(Locale('en'));
                    }
                  },
                  icon: const Icon(Icons.language),
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => {},
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MainButton(
                                  buttonText: "Camera",
                                  onTap: () => {
                                    Navigator.pop(context),
                                    pickImageFromGamera(),
                                  },
                                  buttonBackGroundColor: Colors.purple,
                                ),
                                20.verticalSpace,
                                MainButton(
                                  buttonText: "Gallory",
                                  onTap: () => {
                                    Navigator.pop(context),
                                    pickImageFromGallory(),
                                  },
                                  buttonBackGroundColor: Colors.purple,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: photo != null
                            ? FileImage(File(photo!.path))
                            : null,
                        child: photo == null
                            ? Icon(Icons.person, size: 60.r)
                            : null,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    LocaleKeys.login_mian_title.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight(600),
                      fontSize: 30.sp,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    LocaleKeys.login_sup_title.tr(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  20.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.full_name.tr(),
                        style: TextStyle(fontWeight: FontWeight(600)),
                      ),
                      8.verticalSpace,
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: 'Ahmed Abdelsattar',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      MainButton(
                        buttonText: LocaleKeys.continue_btn.tr(),
                        onTap: () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
