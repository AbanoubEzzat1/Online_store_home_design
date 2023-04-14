import 'dart:async';

import 'package:abanoubezzat_task/core/resources/assets_manger.dart';
import 'package:abanoubezzat_task/core/resources/colors_manager.dart';
import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    AssetsManger.bannerImage,
    AssetsManger.shopsImage,
    AssetsManger.fastOrderImage,
    AssetsManger.restaurantsImage,
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    sliderDuration();
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBannerSliderWidget();
  }

  Widget buildBannerSliderWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pageViewBuilderWidget(),
        verticalDivider(height: 15),
        indicatorWidget(),
      ],
    );
  }

  Widget pageViewWidget({required int index}) {
    return SizedBox(
      height: 344.h,
      width: double.infinity,
      child: Image.asset(
        images[index % images.length],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget pageViewBuilderWidget() {
    return SizedBox(
      height: 150.h,
      width: 345.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0.r),
        child: PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index % images.length;
            });
          },
          itemBuilder: (context, index) {
            return pageViewWidget(index: index);
          },
        ),
      ),
    );
  }

  Widget indicatorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < images.length; i++)
          buildIndicator(currentIndex == i)
      ],
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Container(
      color: ColorsManager.lightGrey,
      child: Container(
        height: 10.h,
        width: isSelected ? 30.w : 20.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: isSelected ? ColorsManager.darkTeal : ColorsManager.lightGrey,
        ),
      ),
    );
  }

  void sliderDuration() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (currentIndex < images.length - 1) {
        controller.animateToPage(currentIndex + 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCirc);
      } else {
        controller.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCirc);
      }
    });
  }
}
