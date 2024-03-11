import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthExpansionTile extends StatelessWidget {
  const HealthExpansionTile({
    super.key,
    required this.healthIssue,
    required this.healthRemedies,
  });

  final String healthIssue;
  final List<dynamic> healthRemedies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ExpansionTile(
        title: Text(
          '$healthIssue Remedies',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          for (int idx = 0; idx < healthRemedies.length; idx++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: ListTile(
                title: Text(
                  "${healthRemedies[idx]['remedy_name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        healthRemedies[idx]['remedy_description'],
                        style: TextStyle(
                          fontSize: 12.h,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
