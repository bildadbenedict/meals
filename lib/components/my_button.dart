import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Color/AppColor.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final Color buttonColor;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 44,
            width: 327,
            decoration: BoxDecoration(
              color: buttonColor, // Use the provided buttonColor
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Center(
              child: Text(
                buttonText,
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color:Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyButton(
              onTap: () {
                // Action for the first button
              },
              buttonText: "Button 1",
              buttonColor: Colors.blue, // Pass a different color for Button 1
            ),
            MyButton(
              onTap: () {
                // Action for the second button
              },
              buttonText: "Button 2",
              buttonColor: Colors.green, // Pass a different color for Button 2
            ),
            MyButton(
              onTap: () {
                // Action for the third button
              },
              buttonText: "Button 3",
              buttonColor: Colors.orange, // Pass a different color for Button 3
            ),
          ],
        ),
      ),
    );
  }
}
