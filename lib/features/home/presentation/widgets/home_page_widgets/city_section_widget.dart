import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CitySectionWidget extends StatelessWidget {
  const CitySectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCitySectionWidget();
  }

  Widget buildCitySectionWidget() {
    return Row(
      children: [
        changeLocationTextWidget(),
        const Spacer(),
        cityLocationTextWidget(),
      ],
    );
  }

  Widget changeLocationTextWidget() {
    return InkWell(
      child: Text(
        "تغيير",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget cityLocationTextWidget() {
    return Row(
      children: [
        Text(
          "طنطا, منطقة الاستاد",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SvgPicture.asset(AssetsManger.locationMark),
      ],
    );
  }
}
