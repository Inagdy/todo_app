import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxline;
  final void Function()? onTap;

  const CustomTextFeild({
    super.key,
    required this.controller,
    required this.hintText, this.maxline, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly:onTap!=null ,
      maxLines: maxline,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        filled: true,
        hintText: hintText,
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
    );
  }
}
