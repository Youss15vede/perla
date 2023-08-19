import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla/core/config/theme/color_manager.dart';


class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      this.icon,
      required this.textInputType,
      required this.textEditingController,
      this.validator,
      required this.hidden,
      required this.title,
      this.maxline = 1})
      : super(key: key);

  final bool hidden;
  final String title;
  Widget? icon;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  int maxline;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      height: maxline == 1 ? 50.h : 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          maxLines: maxline,
          onTap: () {
            textEditingController.selection = TextSelection.fromPosition(
                TextPosition(offset: textEditingController.text.length));
          },
          // textAlign: TextAlign.end,

          obscureText: hidden,
          keyboardType: textInputType,
          controller: textEditingController,
          validator: validator,
          style: TextStyle(
              color: ColorManage.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: icon,
            hintText: title,
            hintStyle: TextStyle(
              color: ColorManage.grey,
              fontWeight: FontWeight.w900,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Colors.white)),
            errorStyle: TextStyle(
                color: ColorManage.error, fontWeight: FontWeight.w900),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: const BorderSide(color: Colors.white),
                gapPadding: 0),
          ),
        ),
      ),
    );
  }
}
