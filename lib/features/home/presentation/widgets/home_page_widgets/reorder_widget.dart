import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:abanoubezzat_task/core/resources/colors_manager.dart';
import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:abanoubezzat_task/core/widgets/items_title_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReorderWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reordeItems = [
    {
      "reordeTitle": "طلب سريع",
      "reordeDescription": "متجر السلام",
      "reordeImage": AssetsManger.fastImage,
    },
    {
      "reordeTitle": "مطعم هندي",
      "reordeDescription": "وجبة العائلة",
      "reordeImage": AssetsManger.indeanResturantImage,
    },
  ];
  ReorderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildReordersWidget();
  }

  Widget buildReordersWidget() {
    return Column(
      children: [
        itemstitleWidget(title: "أعادة الطلب"),
        verticalDivider(height: 16),
        buildSectionListWidget(),
      ],
    );
  }

  Widget buildSectionListWidget() {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: reordeItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildReorderWidgit(
            reorderImage: reordeItems[index]["reordeImage"],
            reordeTitle: reordeItems[index]['reordeTitle'],
            reorderDescription: reordeItems[index]['reordeTitle'],
          );
        },
      ),
    );
  }

  Widget reorderTitleWidget({required String reordeTitle}) => Text(
        reordeTitle,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.black,
        ),
      );

  Widget reorderImageWidget({required String reorderImage}) => Image.asset(
        height: 28.h,
        width: 28.w,
        reorderImage,
        fit: BoxFit.cover,
      );

  Widget reorderImageAndTitle(
          {required String reorderImage, required String reordeTitle}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          reorderTitleWidget(reordeTitle: reordeTitle),
          horizontalDivider(width: 8),
          reorderImageWidget(reorderImage: reorderImage),
        ],
      );

  Padding reorderDescriptionWidget({required String reorderDescription}) =>
      Padding(
        padding: EdgeInsets.only(right: 35.w),
        child: Text(
          reorderDescription,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.darkGrey,
          ),
        ),
      );

  Widget reorderButtonWidget() => InkWell(
        child: Text(
          "اعادة الطلب",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: ColorsManager.darkTeal,
          ),
        ),
      );

  Widget reorderIconWidget() => SvgPicture.asset(
        height: 20.h,
        AssetsManger.reorderIcon,
      );

  Align reorderButtonAndIconWidget() => Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            reorderButtonWidget(),
            horizontalDivider(width: 4),
            reorderIconWidget(),
          ],
        ),
      );

  Padding reorderItemWidgit({
    required String reorderImage,
    required String reordeTitle,
    required String reorderDescription,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reorderImageAndTitle(
              reorderImage: reorderImage,
              reordeTitle: reordeTitle,
            ),
            verticalDivider(height: 10),
            reorderDescriptionWidget(reorderDescription: reorderDescription),
            verticalDivider(height: 10),
            reorderButtonAndIconWidget(),
          ],
        ),
      );

  Padding buildReorderWidgit({
    required String reorderImage,
    required String reordeTitle,
    required String reorderDescription,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: Container(
        height: 100.h,
        width: 200.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsManager.darkGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: reorderItemWidgit(
          reorderImage: reorderImage,
          reordeTitle: reordeTitle,
          reorderDescription: reorderDescription,
        ),
      ),
    );
  }
}
