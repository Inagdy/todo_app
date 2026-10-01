import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/widgets/home_screen_bar.dart';
import 'package:todo_app/features/home/widgets/home_task.dart';
import 'package:todo_app/gen/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add),
            8.horizontalSpace,
            Text(LocaleKeys.Add_Task.tr()),
          ],          
        ), 
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              HomeAppBar(),
              20.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const HomeTask();
                  },
                ),
              ),

              ]),
        ),
      ),
    );
  }
}
