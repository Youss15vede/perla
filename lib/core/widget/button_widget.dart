import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {Key? key,
      required this.ontap,
      required this.title,
      required this.height,
      required this.width,
      required this.buttonColor,
      this.titleColor,
      this.titleSize = 20})
      : super(key: key);

  final String title;
  final double height;
  final double width;
  final Color buttonColor;
  Color? titleColor;
  final double? titleSize;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          color: buttonColor,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: titleColor ?? Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: titleSize!.sp),
        )),
      ),
    );
  }
}
