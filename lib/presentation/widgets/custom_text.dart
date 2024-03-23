import 'package:flutter/material.dart';
import 'package:tz_app/core/ui/app_colors.dart';
import 'package:tz_app/core/ui/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title3Color,
  });

  final String title;
  final String title2;
  final String title3;
  final Color title3Color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.textStyleF16(
                AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 82,
                  child: Text(
                    title2,
                    style: AppTextStyles.textStyleF14(
                      Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 4,
                  width: 4,
                ),
                const SizedBox(width: 5),
                Text(
                  title3,
                  style: TextStyle(
                    fontSize: 14,
                    color: title3Color,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
