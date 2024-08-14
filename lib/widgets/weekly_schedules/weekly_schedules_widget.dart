import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/widgets/weekly_schedules/week_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';

class WeeklySchedulesWidget extends StatefulWidget {
  const WeeklySchedulesWidget({
    required this.controller,
    super.key,
  });
  final ScrollController controller;

  @override
  State<WeeklySchedulesWidget> createState() => _WeeklySchedulesWidgetState();
}

class _WeeklySchedulesWidgetState extends State<WeeklySchedulesWidget> {
  int length = 7;
  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenType == ScreenType.desktop ? 20 : 15),
            child: AppTexts.titleBold(
              text: 'الجداول الأسبوعية',
              fontSize:
                  screenType == ScreenType.mobile || screenType == ScreenType.miniTablet ? 20 : 28,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenType == ScreenType.desktop ? 20 : 15),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 13.333.w,
                  child: AppTexts.bodyRegular(
                    text: 'رقم الأسبوع',
                    fontColor: AppColors.slate500,
                    fontSize: screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                        ? 12
                        : 14,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: 19.93.w,
                    child: AppTexts.bodyRegular(
                      text: 'التاريخ',
                      fontColor: AppColors.slate500,
                      fontSize:
                          screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                              ? 12
                              : 14,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: AppTexts.bodyRegular(
                      text: 'التقدم',
                      fontColor: AppColors.slate500,
                      fontSize:
                          screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                              ? 12
                              : 14,
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 12.09.w,
                //   child: AppTexts.bodyRegular(
                //     text: 'المعدل',
                //     fontColor: AppColors.slate500,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 1.6.h,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0.5),
            width: double.maxFinite,
            color: AppColors.slate200,
          ),
          WeekSlot(
            weekNumber: '01',
            weekDate: '2024-02-27 إلى 07-03-2024',
            weekProgress: 63,
            weekAvg: 60,
            controller: widget.controller,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0.5),
            width: double.maxFinite,
            color: AppColors.slate200,
          ),
          WeekSlot(
            weekNumber: '02',
            weekDate: '2024-03-08 إلى 17-03-2024',
            weekProgress: 85,
            weekAvg: 82,
            controller: widget.controller,
            // isClicked: true,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0.5),
            width: double.maxFinite,
            color: AppColors.slate200,
          ),
          WeekSlot(
            weekNumber: '03',
            weekDate: '2024-03-18 إلى 27-03-2024',
            weekProgress: 75,
            weekAvg: 49,
            controller: widget.controller,
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.only(bottom: 0.5),
            width: double.maxFinite,
            color: AppColors.slate200,
          ),
          SizedBox(
            height: 20,
          ),
          Builder(builder: (context) {
            if (screenType == ScreenType.mobile ||
                screenType == ScreenType.miniTablet ||
                screenType == ScreenType.smallTablet) {
              return SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(alignment: Alignment.center, child: resultsPagesWidget(screenType)),
                      SizedBox(
                        height: 20,
                      ),
                      AppTexts.bodyRegular(text: 'النتائج: 1 - 7 من 40'),
                    ],
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  AppTexts.bodyRegular(text: 'النتائج: 1 - 7 من 40'),
                  Spacer(),
                  resultsPagesWidget(screenType)
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Row resultsPagesWidget(ScreenType screenType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'images/forward_courses_list.svg',
              height: 40,
              width: 40,
            ),
          ),
        ),
        SizedBox(
          width: AppDimensions.w12,
        ),
        Row(
          children: List.generate(
            length,
            (index) {
              if (index == length - 1) {
                return Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.slate50,
                    border: Border.all(color: AppColors.slate200),
                  ),
                  child: Center(
                    child: AppTexts.bodyRegular(
                      text: '${index + 1}',
                      fontColor: AppColors.slate900,
                      fontSize: 16,
                    ),
                  ),
                );
              } else if (index == length - 3) {
                return Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.slate50,
                    border: Border.all(color: AppColors.slate200),
                  ),
                  child: Center(
                    child: AppTexts.bodyRegular(
                      text: '....',
                      fontColor: AppColors.slate900,
                      fontSize: 16,
                    ),
                  ),
                );
              } else if (index > 2) {
                return SizedBox();
              }
              return Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.white : AppColors.slate50,
                  border: Border.all(
                    color: index == 0 ? AppColors.blue600 : AppColors.slate200,
                  ),
                ),
                child: Center(
                  child: AppTexts.bodyRegular(
                    text: '${index + 1}',
                    fontColor: AppColors.slate900,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ),
        SvgPicture.asset(
          'images/forward_courses_list.svg',
          height: 40,
          width: 40,
        )
      ],
    );
  }
}
