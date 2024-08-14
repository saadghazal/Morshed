import 'dart:io';

import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';
import 'course_week_widget.dart';

class WeekSlot extends StatefulWidget {
  const WeekSlot({
    required this.weekNumber,
    required this.weekDate,
    required this.weekProgress,
    required this.weekAvg,
    required this.controller,
    // this.isClicked = false,
    super.key,
  });
  final String weekNumber;
  final String weekDate;
  final double weekProgress;
  final double weekAvg;
  final ScrollController controller;

  @override
  State<WeekSlot> createState() => _WeekSlotState();
}

class _WeekSlotState extends State<WeekSlot> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  bool isClicked = false;

  clickOnWeek() {
    setState(
      () {
        isClicked = !isClicked;
        if (isClicked) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
        Future.delayed(
          Duration(milliseconds: 20),
          () {
            widget.controller.animateTo(
              widget.controller.position.maxScrollExtent,
              duration: Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;

    var avgTextColor;
    var avgBgColor;
    if (widget.weekAvg <= 50) {
      avgTextColor = AppColors.red500;
      avgBgColor = AppColors.red50;
    } else if (widget.weekAvg > 50 && widget.weekAvg < 80) {
      avgTextColor = AppColors.orange400;
      avgBgColor = AppColors.orange50;
    } else {
      avgTextColor = AppColors.green500;
      avgBgColor = AppColors.green50;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      padding: EdgeInsets.only(
        bottom: 25,
        top: 25,
        left: 20,
        right: 20,
      ),
      color: isClicked ? AppColors.blue50 : Colors.white,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.horizontal,
              children: [
                SizedBox(
                  width: 13.333.w,
                  child: screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                      ? Visibility(
                          visible: isClicked,
                          replacement: AppTexts.bodyMedium(
                            text: widget.weekNumber,
                            fontColor: isClicked ? AppColors.blue600 : AppColors.slate900,
                            fontSize: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isClicked ? AppColors.yellow400 : Colors.transparent,
                                ),
                                child: Center(
                                  child: AppTexts.bodyMedium(
                                    text: widget.weekNumber,
                                    fontColor: isClicked ? AppColors.blue600 : AppColors.slate900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTexts.bodyMedium(
                              text: widget.weekNumber,
                              fontColor: isClicked ? AppColors.blue600 : AppColors.slate900,
                              fontSize: 18,
                            ),
                            Visibility(
                              visible: isClicked,
                              replacement: SizedBox(),
                              child: Flexible(
                                child: IntrinsicWidth(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 17),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenType == ScreenType.desktop ? 12 : 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: AppColors.yellow400,
                                    ),
                                    child: Center(
                                      child: AppTexts.bodyRegular(
                                        text: 'الأسبوع الحالي',
                                        fontColor: AppColors.slate900,
                                        fontSize: screenType == ScreenType.desktop ? 16 : 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Flexible(
                  // flex: 6,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: 19.93.w,
                    child: AppTexts.bodyMedium(
                      text: widget.weekDate,
                      fontColor: isClicked ? AppColors.blue600 : AppColors.slate900,
                      fontSize: screenType == ScreenType.desktop
                          ? 18
                          : screenType == ScreenType.largeTablet ||
                                  screenType == ScreenType.smallTablet
                              ? 16
                              : 14,
                      textOverflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: LinearPercentIndicator(
                            percent: widget.weekProgress / 100,
                            lineHeight: 4,
                            progressColor: AppColors.blue600,
                            backgroundColor: AppColors.slate200,
                            isRTL: true,
                            barRadius: const Radius.circular(9),
                          ),
                        ),
                        SizedBox(
                          width: 0.63.w,
                        ),
                        AppTexts.bodyRegular(
                          text: '${widget.weekProgress}%',
                          fontColor: AppColors.slate900,
                          fontSize: screenType == ScreenType.desktop ? 16 : 14,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: clickOnWeek,
                          child: isClicked
                              ? Ink(
                                  child: RotatedBox(
                                    quarterTurns: 2,
                                    child: SvgPicture.asset(
                                      'images/Down.svg',
                                      color: AppColors.slate400,
                                      height: screenType == ScreenType.smallTablet ||
                                              screenType == ScreenType.mobile ||
                                              screenType == ScreenType.miniTablet
                                          ? 20
                                          : 24,
                                      width: screenType == ScreenType.smallTablet ||
                                              screenType == ScreenType.mobile ||
                                              screenType == ScreenType.miniTablet
                                          ? 20
                                          : 24,
                                    ),
                                  ),
                                )
                              : SvgPicture.asset(
                                  'images/Down.svg',
                                  color: AppColors.slate400,
                                  height: screenType == ScreenType.smallTablet ||
                                          screenType == ScreenType.mobile ||
                                          screenType == ScreenType.miniTablet
                                      ? 20
                                      : 24,
                                  width: screenType == ScreenType.smallTablet ||
                                          screenType == ScreenType.mobile ||
                                          screenType == ScreenType.miniTablet
                                      ? 20
                                      : 24,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isClicked,
              child: Column(
                children: [
                  const SizedBox(
                    height: 26,
                  ),
                  SizedBox(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: AppDimensions.w20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenType == ScreenType.desktop
                            ? 3
                            : screenType == ScreenType.mobile
                                ? 1
                                : 2,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 118,
                      ),
                      itemCount: 5,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: CourseWeekWidget(),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
