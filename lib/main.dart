import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utile/app_constance.dart';
import 'package:todo_app/features/login/data/user_model.dart';
import 'package:todo_app/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

   Hive.registerAdapter(UserModelAdapter());
   await Hive.openBox<UserModel>(AppConstants.userBox);


  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const TodoApp(),
    ),
  );
}
