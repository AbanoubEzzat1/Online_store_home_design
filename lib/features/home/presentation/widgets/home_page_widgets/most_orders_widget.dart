import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:abanoubezzat_task/core/resources/colors_manager.dart';
import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:abanoubezzat_task/core/widgets/items_title_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostOrderWidget extends StatelessWidget {
  final List<Map<String, dynamic>> mostOrderItems = [
    {"mostOrderImage": AssetsManger.spectraImage},
    {"mostOrderImage": AssetsManger.cookDoorImage},
  ];
  MostOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildMostOrderWidget();
  }

  Widget buildMostOrderWidget() {
    return Column(
      children: [
        mostOrderTitleWidget(),
        verticalDivider(height: 23),
        buildMostOrderListWidget(),
      ],
    );
  }

  Widget backArrowIconWidget() => SvgPicture.asset(
        height: 20.h,
        width: 20.w,
        AssetsManger.backArrowIcon,
      );

  Widget textAllWidget() => Text(
        "الكل",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.darkTeal,
        ),
      );

  Widget mostOrderTitleWidget() => Row(
        children: [
          backArrowIconWidget(),
          horizontalDivider(width: 4),
          textAllWidget(),
          const Spacer(),
          itemstitleWidget(title: "الاكثر طلبا"),
        ],
      );

  Widget mostOrderimageWidget({required String mostOrderImage}) => Image.asset(
        mostOrderImage,
        fit: BoxFit.cover,
      );

  Widget mostOrderWidget({required String mostOrderImage}) {
    return SizedBox(
      height: 120.h,
      width: 240.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0.r),
        child: mostOrderimageWidget(mostOrderImage: mostOrderImage),
      ),
    );
  }

  Widget buildMostOrderListWidget() {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => horizontalDivider(width: 12),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: mostOrderItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return mostOrderWidget(
            mostOrderImage: mostOrderItems[index]['mostOrderImage'],
          );
        },
      ),
    );
  }
}
