import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/custom_text_feild.dart';
import 'package:todo_app/gen/locale_keys.g.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(LocaleKeys.Add_Task.tr()),
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.Task_Title.tr()),
            CustomTextFeild(
              controller: null,
              hintText: LocaleKeys.Task_Title_Input.tr(),
            ),
            Text(LocaleKeys.Task_descreption.tr()),
            CustomTextFeild(
              maxline: 6,
              controller: null,
              hintText: LocaleKeys.Task_Subtitle.tr(),
            ),
        Row(
          children: [
            Expanded(
              child: CustomTextFeild(
                onTap: () => {
                  showDatePicker(context: context,
                   firstDate:DateTime.now(), lastDate: DateTime(9999) ,
                  )
                },
                controller: null,
                hintText: LocaleKeys.Date.tr(),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: CustomTextFeild(
                onTap: () => {
                  showTimePicker(context: context,
                   initialTime:TimeOfDay.now(), )
                },
                controller: null,
                hintText: LocaleKeys.Time.tr(),
              ),
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}
