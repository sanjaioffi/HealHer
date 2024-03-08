import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_colors.dart';
import '../../home/presentation/widgets/home_grid_view.dart';

class RecommendationScrren extends StatelessWidget {
  const RecommendationScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.56,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.heavyPurplyBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
          ),
          const HomeGridView(),
        ],
      ),
    );
  }
}
