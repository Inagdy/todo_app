import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/gen/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(LocaleKeys.login_mian_title),
            Text(LocaleKeys.login_sup_title),
            IconButton(
              onPressed: () {
                if (context.locale.languageCode == "en") {
                  context.setLocale(Locale("ar"));
                } else {
                  context.setLocale(Locale("en"));
                }
              },
              icon: Icon(Icons.language),
            ),
          ],
        ),
      ),
    );
  }
}
