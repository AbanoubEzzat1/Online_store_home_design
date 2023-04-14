import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:abanoubezzat_task/core/resources/colors_manager.dart';
import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:abanoubezzat_task/core/widgets/items_title_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> sectionsItems = [
    {"sectionTitle": "بقالة", "SectionImages": AssetsManger.shopsImage},
    {"sectionTitle": "المطاعم", "SectionImages": AssetsManger.restaurantsImage},
    {
      "sectionTitle": "الطلب السريع",
      "SectionImages": AssetsManger.fastOrderImage
    },
  ];
  SectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildSectionsWidget();
  }

  Widget buildSectionsWidget() {
    return Column(
      children: [
        itemstitleWidget(title: "الاقسام"),
        verticalDivider(height: 16),
        buildSectionListWidget(),
      ],
    );
  }

  Widget buildSectionListWidget() {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: sectionsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return sectionsItemWidgit(
            sectionImage: sectionsItems[index]['SectionImages'],
            sectionTitle: sectionsItems[index]['sectionTitle'],
          );
        },
      ),
    );
  }

  Widget sectionImageWidget({required String sectionImage}) => Image.asset(
        sectionImage,
        fit: BoxFit.cover,
      );

  Positioned sectionTitleWidget({required String sectionTitle}) => Positioned(
        bottom: 15.h,
        right: 5.h,
        left: 5.h,
        child: Text(
          sectionTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      );

  Padding sectionsItemWidgit({
    required String sectionImage,
    required String sectionTitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0.r),
        child: SizedBox(
          height: 130.h,
          width: 130.w,
          child: Stack(
            children: [
              sectionImageWidget(sectionImage: sectionImage),
              sectionTitleWidget(sectionTitle: sectionTitle)
            ],
          ),
        ),
      ),
    );
  }
}
