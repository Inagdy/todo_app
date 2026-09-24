import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome".tr()),
            Text("login_mian_title".tr()),
            Text("login_sup_title".tr()),
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
