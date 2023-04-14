import 'package:abanoubezzat_task/core/widgets/dividers_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/banner_slider_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/city_section_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/most_orders_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/reorder_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/search_and_cart_section_widget.dart';
import 'package:abanoubezzat_task/features/home/presentation/widgets/home_page_widgets/sections_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildHomePageWidgets();
  }

  Widget homePageItemsWidget() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
        child: Column(
          children: [
            const CitySectionWidget(),
            verticalDivider(height: 16),
            const SearchAndCartSection(),
            verticalDivider(height: 21),
            const BannerSlider(),
            verticalDivider(height: 24),
            SectionsWidget(),
            verticalDivider(height: 26),
            ReorderWidget(),
            verticalDivider(height: 26),
            MostOrderWidget(),
          ],
        ),
      );

  Widget buildHomePageWidgets() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: homePageItemsWidget(),
        ),
      ),
    );
  }
}
