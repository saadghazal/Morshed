import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../blox/drawer_cubit/drawer_cubit.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class CourseWeekWidget extends StatefulWidget {
  const CourseWeekWidget({
    super.key,
  });

  @override
  State<CourseWeekWidget> createState() => _CourseWeekWidgetState();
}

class _CourseWeekWidgetState extends State<CourseWeekWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;

    return InkWell(
      onTap: () {
        context.read<DrawerCubit>().openDrawer(
              context: context,
              drawerType: DrawerType.performance,
            );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.slate200,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'images/arabic.svg',
                  height: screenType == ScreenType.smallTablet ||
                          screenType == ScreenType.mobile ||
                          screenType == ScreenType.miniTablet
                      ? 34
                      : 44,
                  width: screenType == ScreenType.smallTablet ||
                          screenType == ScreenType.mobile ||
                          screenType == ScreenType.miniTablet
                      ? 34
                      : 44,
                ),
                SizedBox(
                  width: 0.8.w,
                ),
                AppTexts.bodyRegular(
                  text: 'مهارات الاتصال',
                  fontSize: screenType == ScreenType.smallTablet ||
                          screenType == ScreenType.mobile ||
                          screenType == ScreenType.miniTablet
                      ? 14
                      : 16,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'images/Left.svg',
                  height: 16,
                  width: 16,
                )
              ],
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    percent: 0.5,
                    lineHeight: 4,
                    progressColor: AppColors.blue600,
                    backgroundColor: AppColors.slate200,
                    isRTL: true,
                    barRadius: const Radius.circular(9),
                  ),
                ),
                // SizedBox(
                //   width: 4,
                // ),
                AppTexts.bodyRegular(
                  text: '50%',
                  fontColor: AppColors.slate900,
                  fontSize: screenType == ScreenType.smallTablet ||
                          screenType == ScreenType.mobile ||
                          screenType == ScreenType.miniTablet
                      ? 14
                      : 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
