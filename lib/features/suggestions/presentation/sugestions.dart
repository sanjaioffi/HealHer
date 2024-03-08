import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constants/constants.dart';
import '../../../config/theme/app_colors.dart';
import 'widgets/suggestions_bmi.dart';
import 'widgets/suggestions_tile.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.401,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.heavyPurplyBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 45.h,
                  ),
                  child: const Column(
                    children: [
                      BmiIndicator(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 18.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 250,
                mainAxisSpacing: 50,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SuggestionsTile(
                  tileColor: recommendationTileColors[index],
                  title: recommendationTileStrings[index],
                  tileSubStrings: recommendationTileSubStrings[index],
                  tileIcon: recommendationTileIcons[index],
                  appRoute: recommendationAppRoutes[index],
                );
              },
            ),
          ),
          //
        ],
      ),
    );
  }
}
