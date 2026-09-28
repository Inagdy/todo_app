import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  final Color? buttonBackGroundColor;

  const MainButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.buttonBackGroundColor = const Color.fromARGB(255, 13, 69, 115),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: buttonBackGroundColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
