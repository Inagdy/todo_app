
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/utile/app_constance.dart';
import 'package:todo_app/features/login/data/user_model.dart' show UserModel;



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserModel>(AppConstants.userBox)
        .get(AppConstants.currentUser);
    final imagePath = user?.image ?? "";
    final hasImage = imagePath.isNotEmpty && File(imagePath).existsSync();

return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: hasImage ? FileImage(File(imagePath)) : null,
          child: hasImage ? null : Icon(Icons.person, size: 40.r),
        ),
        20.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("greeting".tr()),
              Text(user?.name ?? " "),
            ],
          ),
        ),
                


             Padding(
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

        Icon(Icons.notifications_none, size: 30.r),
        
      ],
    );
  }
}