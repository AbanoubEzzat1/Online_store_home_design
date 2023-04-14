import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:flutter/material.dart';
import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/resources/colors_manager.dart';

class SearchAndCartSection extends StatelessWidget {
  const SearchAndCartSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildSearchAndCartSection();
  }

  Widget buildSearchAndCartSection() {
    return Row(
      children: [
        buildCartAndmoneyWidget(),
        horizontalDivider(width: 12),
        buildSearchWidget(),
      ],
    );
  }

// buildCartAndmoneyWidget
  Widget cartSVGImageWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: SvgPicture.asset(
        height: 45.h,
        AssetsManger.cartIcon,
      ),
    );
  }

  Widget cartCountWidget() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        height: 14.h,
        width: 14.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsManager.lightOrange,
        ),
        child: Center(
            child: Text(
          "50",
          style: TextStyle(
            color: ColorsManager.black,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
    );
  }

  Widget cartWithCartCountWidget() {
    return Stack(
      children: [
        cartSVGImageWidget(),
        cartCountWidget(),
      ],
    );
  }

  Widget moneyAndCartDevidirWidget() {
    return Container(
      width: 2.w,
      height: 24.h,
      color: ColorsManager.grayishBlueColor,
    );
  }

  Widget totalMoneyTextWidget() {
    return Text("ج 300",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ));
  }

  Padding cartAndmoneyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          totalMoneyTextWidget(),
          moneyAndCartDevidirWidget(),
          cartWithCartCountWidget(),
        ],
      ),
    );
  }

  Widget buildCartAndmoneyWidget() {
    return Container(
      width: 97.w,
      height: 36.h,
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: cartAndmoneyWidget(),
    );
  }

// buildSearchWidget
  Widget textFormField() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'ابحث عن وجبة او مطعم',
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: SvgPicture.asset(AssetsManger.searchIcon),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildSearchWidget() {
    return Expanded(
      child: Container(
        width: 259.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: ColorsManager.lightGrey,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: textFormField(),
      ),
    );
  }
}
