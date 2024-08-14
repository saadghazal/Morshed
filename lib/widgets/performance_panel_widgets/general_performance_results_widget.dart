import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class GeneralPerformanceResultsWidget extends StatefulWidget {
  const GeneralPerformanceResultsWidget({
    required this.selectedIndex,
    required this.select,
    super.key,
  });
  final int selectedIndex;
  final Function(int) select;

  @override
  State<GeneralPerformanceResultsWidget> createState() => _GeneralPerformanceResultsWidgetState();
}

class _GeneralPerformanceResultsWidgetState extends State<GeneralPerformanceResultsWidget> {
  double opacity1 = 0;
  double opacity2 = 0;
  double opacity3 = 0;
  double opacity4 = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(milliseconds: 500),
    ).then(
      (_) {
        setState(() {
          opacity1 = 1;
        });
        Future.delayed(Duration(milliseconds: 300)).then(
          (_) {
            setState(
              () {
                opacity2 = 1;
              },
            );
            Future.delayed(Duration(milliseconds: 300)).then(
              (_) {
                setState(
                  () {
                    opacity3 = 1;
                  },
                );
                Future.delayed(Duration(milliseconds: 300)).then(
                  (_) {
                    setState(
                      () {
                        opacity4 = 1;
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return screenType != ScreenType.smallTablet &&
            screenType != ScreenType.mobile &&
            screenType != ScreenType.miniTablet
        ? Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              resultWidget(
                headline: 'المعدل',
                icon: 'images/avg_icon.svg',
                opacity: opacity1,
                screenType: screenType,
                iconHeight: screenType == ScreenType.desktop ? 32 : 28,
                iconWidth: screenType == ScreenType.desktop ? 32 : 28,
                result: AppTexts.titleMedium(
                  text: '87%',
                  fontSize: screenType == ScreenType.desktop ? 34 : 30,
                ),
                backgroundColor: AppColors.purple50,
                unselectedBorderColor: AppColors.purple200,
                selectedBorderColor: AppColors.purple400,
                isSelected: widget.selectedIndex == 0,
                index: 0,
                select: widget.select,
              ),
              // Spacer(),
              SizedBox(
                width: AppDimensions.w20,
              ),
              resultWidget(
                opacity: opacity2,
                screenType: screenType,
                icon: 'images/blue_avg_icon.svg',
                headline: 'عدد الأسئلة المحلولة',
                iconHeight: screenType == ScreenType.desktop ? 32 : 28,
                iconWidth: screenType == ScreenType.desktop ? 32 : 28,
                result: AppTexts.titleMedium(
                  text: '30',
                  fontSize: screenType == ScreenType.desktop ? 34 : 30,
                ),
                backgroundColor: AppColors.blue50,
                unselectedBorderColor: AppColors.blue200,
                selectedBorderColor: AppColors.blue600,
                isSelected: widget.selectedIndex == 1,
                index: 1,
                select: widget.select,
              ),
              // Spacer(),
              SizedBox(
                width: AppDimensions.w20,
              ),
              resultWidget(
                opacity: opacity3,
                screenType: screenType,
                icon: 'images/qa_icon.svg',
                headline: 'عدد الأسئلة في خاصية س/ج',
                iconHeight: screenType == ScreenType.desktop ? 32 : 28,
                iconWidth: screenType == ScreenType.desktop ? 32 : 28,
                result: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppTexts.titleMedium(
                            text: '7',
                            fontSize: screenType == ScreenType.desktop ? 34 : 30,
                          ),
                          AppTexts.bodyRegular(
                            text: 'المضافة',
                            fontSize: screenType == ScreenType.desktop ? 14 : 12,
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTexts.titleMedium(
                            text: '5',
                            fontSize: screenType == ScreenType.desktop ? 34 : 30,
                          ),
                          AppTexts.bodyRegular(
                            text: 'تم إجابتها',
                            fontSize: screenType == ScreenType.desktop ? 14 : 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                backgroundColor: AppColors.green50,
                unselectedBorderColor: AppColors.green200,
                selectedBorderColor: AppColors.green500,
                isSelected: widget.selectedIndex == 2,
                index: 2,
                select: widget.select,
              ),
              // Spacer(),
              SizedBox(
                width: AppDimensions.w20,
              ),
              resultWidget(
                opacity: opacity4,
                screenType: screenType,
                icon: 'images/wrong_icon.svg',
                headline: 'الأخطاء السابقة المتبقية',
                iconHeight: screenType == ScreenType.desktop ? 32 : 28,
                iconWidth: screenType == ScreenType.desktop ? 32 : 28,
                result: AppTexts.titleMedium(
                  text: '11',
                  fontSize: screenType == ScreenType.desktop ? 34 : 30,
                ),
                backgroundColor: AppColors.red50,
                unselectedBorderColor: AppColors.red200,
                selectedBorderColor: AppColors.red500,
                isSelected: widget.selectedIndex == 3,
                index: 3,
                select: widget.select,
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  resultWidget(
                    headline: 'المعدل',
                    icon: 'images/avg_icon.svg',
                    opacity: opacity1,
                    screenType: screenType,
                    iconHeight: 28,
                    iconWidth: 28,
                    result: AppTexts.titleMedium(
                      text: '87%',
                      fontSize: screenType == ScreenType.mobile ? 22 : 34,
                    ),
                    backgroundColor: AppColors.purple50,
                    unselectedBorderColor: AppColors.purple200,
                    selectedBorderColor: AppColors.purple400,
                    isSelected: widget.selectedIndex == 0,
                    index: 0,
                    select: widget.select,
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 12,
                  ),
                  resultWidget(
                    opacity: opacity2,
                    screenType: screenType,
                    icon: 'images/blue_avg_icon.svg',
                    headline: 'عدد الأسئلة المحلولة',
                    iconHeight: 28,
                    iconWidth: 28,
                    result: AppTexts.titleMedium(
                      text: '30',
                      fontSize: screenType == ScreenType.mobile ? 22 : 34,
                    ),
                    backgroundColor: AppColors.blue50,
                    unselectedBorderColor: AppColors.blue200,
                    selectedBorderColor: AppColors.blue600,
                    isSelected: widget.selectedIndex == 1,
                    index: 1,
                    select: widget.select,
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  resultWidget(
                    opacity: opacity3,
                    screenType: screenType,
                    icon: 'images/qa_icon.svg',
                    headline: 'عدد الأسئلة في خاصية س/ج',
                    iconHeight: 28,
                    iconWidth: 28,
                    result: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: screenType == ScreenType.mobile
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    AppTexts.titleMedium(
                                      text: '7',
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    AppTexts.bodyRegular(
                                      text: 'المضافة',
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AppTexts.titleMedium(
                                      text: '5',
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    AppTexts.bodyRegular(
                                      text: 'تم إجابتها',
                                      fontSize: 13,
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppTexts.titleMedium(
                                      text: '7',
                                      fontSize: 34,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    AppTexts.bodyRegular(
                                      text: 'المضافة',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppTexts.titleMedium(
                                      text: '5',
                                      fontSize: 34,
                                    ),
                                    AppTexts.bodyRegular(
                                      text: 'تم إجابتها',
                                      fontSize: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                    backgroundColor: AppColors.green50,
                    unselectedBorderColor: AppColors.green200,
                    selectedBorderColor: AppColors.green500,
                    isSelected: widget.selectedIndex == 2,
                    index: 2,
                    select: widget.select,
                  ),
                  // Spacer(),
                  SizedBox(
                    width: 12,
                  ),
                  resultWidget(
                    opacity: opacity4,
                    screenType: screenType,
                    icon: 'images/wrong_icon.svg',
                    headline: 'الأخطاء السابقة المتبقية',
                    iconHeight: 28,
                    iconWidth: 28,
                    result: AppTexts.titleMedium(
                      text: '11',
                      fontSize: screenType == ScreenType.mobile ? 22 : 34,
                    ),
                    backgroundColor: AppColors.red50,
                    unselectedBorderColor: AppColors.red200,
                    selectedBorderColor: AppColors.red500,
                    isSelected: widget.selectedIndex == 3,
                    index: 3,
                    select: widget.select,
                  )
                ],
              )
            ],
          );
  }

  Widget resultWidget({
    required String icon,
    required ScreenType screenType,
    required String headline,
    required Widget result,
    required double opacity,
    required Color unselectedBorderColor,
    required Color selectedBorderColor,
    required Color backgroundColor,
    required Function(int) select,
    required int index,
    double iconHeight = 32,
    double iconWidth = 32,
    bool isSelected = false,
  }) {
    return Flexible(
      child: InkWell(
        onTap: () => select(index),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 400),
          child: Container(
            height: screenType == ScreenType.mobile ? 183 : 165,
            padding: EdgeInsets.only(
              top: screenType == ScreenType.mobile ? 12 : 20,
              right: screenType == ScreenType.mobile ? 12 : 20,
            ),
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(
                      color: selectedBorderColor,
                      width: 2,
                    )
                  : Border.all(
                      color: unselectedBorderColor,
                    ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 2,
                        color: Colors.black12,
                        offset: Offset(0, 6),
                      ),
                    ]
                  : null,
              color: backgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      icon,
                      height: iconHeight,
                      width: iconWidth,
                    ),
                    index == 3 ? Spacer() : SizedBox(),
                    index == 3
                        ? Padding(
                            padding: EdgeInsets.only(left: AppDimensions.w12),
                            child: SvgPicture.asset(
                              'images/Info.svg',
                              height: screenType == ScreenType.desktop ? 24 : 20,
                              width: screenType == ScreenType.desktop ? 24 : 20,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: AppTexts.bodyMedium(
                    text: headline,
                    fontColor: AppColors.slate900,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                result,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
