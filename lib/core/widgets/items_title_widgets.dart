import 'package:abanoubezzat_task/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Align itemstitleWidget({required String title}) => Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 21.sp,
          color: ColorsManager.black,
        ),
      ),
    );
