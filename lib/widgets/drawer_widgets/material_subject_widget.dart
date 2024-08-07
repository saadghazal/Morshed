import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';

enum SubjectType {
  video,
  exam,
  file,
}

class MaterialSubjectWidget extends StatefulWidget {
  const MaterialSubjectWidget({
    this.subjectType = SubjectType.video,
    required this.title,
    required this.isCompleted,
    required this.subtitle1,
    required this.subtitle2,
    this.onTap,
    this.isDaily = false,
    this.completedDate,
    this.numberOfSolvedQuestions,
    this.numberOfTries,
    this.results,
    super.key,
  });

  final SubjectType subjectType;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final bool isCompleted;
  final bool isDaily;
  final String? completedDate;
  final int? numberOfTries;
  final List<Result>? results;
  final int? numberOfSolvedQuestions;
  final VoidCallback? onTap;

  @override
  State<MaterialSubjectWidget> createState() => _MaterialSubjectWidgetState();
}

class _MaterialSubjectWidgetState extends State<MaterialSubjectWidget> {
  bool isShowed = false;
  SuperTooltipController controller = SuperTooltipController();

  showTooltip() {
    setState(() {
      isShowed = true;
    });
  }

  hideTooltip() {
    setState(() {
      isShowed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Container(
      height: 104,
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.w20 + AppDimensions.w12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.slate200,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Builder(
          builder: (context) {
            if (widget.subjectType == SubjectType.video) {
              return videoPDFWidget(iconPath: 'images/play_video.svg');
            } else if (widget.subjectType == SubjectType.exam) {
              return Flex(
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: leadingWidget(iconPath: 'images/Test.svg'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bodyRegular(
                          text: 'عدد المحاولات',
                          fontColor: AppColors.slate500,
                          fontSize: 14,
                        ),
                        widget.isCompleted
                            ? const SizedBox(
                                height: 12,
                              )
                            : const SizedBox(
                                height: 8,
                              ),
                        widget.isCompleted
                            ? AppTexts.bodyMedium(
                                text: '${widget.numberOfTries}',
                                fontColor: AppColors.slate900,
                              )
                            : Container(
                                width: 117,
                                height: 30,
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppDimensions.w12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.slate50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppTexts.bodyRegular(
                                      text: 'تم إجابة',
                                      fontSize: screenType == ScreenType.desktop ? 14 : 12,
                                      fontColor: AppColors.slate900,
                                    ),
                                    Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Dubai',
                                          fontSize: screenType == ScreenType.desktop ? 14 : 12,
                                          color: AppColors.slate400,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: '20/',
                                          ),
                                          TextSpan(
                                            text: widget.numberOfSolvedQuestions!.toString(),
                                            style: TextStyle(
                                              color: AppColors.slate900,
                                              fontSize: screenType == ScreenType.desktop ? 16 : 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: widget.results != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTexts.bodyRegular(
                                text: 'النتيجة',
                                fontColor: AppColors.slate500,
                                fontSize: 14,
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              SuperTooltip(
                                controller: controller,
                                showBarrier: false,
                                hasShadow: false,
                                borderColor: Colors.transparent,
                                minimumOutsideMargin: 0,
                                backgroundColor: Colors.transparent,
                                popupDirection: TooltipDirection.up,
                                content: IntrinsicHeight(
                                  child: IntrinsicWidth(
                                    child: Container(
                                      // width: 200,
                                      padding:
                                          EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 9),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: AppColors.slate200,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          widget.results!.length,
                                          (index) {
                                            Color? backgroundColor;
                                            Color? markColor;
                                            if (widget.results![index].mark < 10) {
                                              backgroundColor = AppColors.red50;
                                              markColor = AppColors.red500;
                                            } else if (widget.results![index].mark <= 15) {
                                              backgroundColor = AppColors.orange502;
                                              markColor = AppColors.orange400;
                                            } else {
                                              backgroundColor = AppColors.green50;
                                              markColor = AppColors.green500;
                                            }
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom: index != widget.results!.length - 1 ? 8 : 0,
                                              ),
                                              child: Row(
                                                children: [
                                                  AppTexts.bodyMedium(
                                                    text: widget.results![index].tryDate,
                                                    fontColor: AppColors.slate900,
                                                  ),
                                                  SizedBox(
                                                    width: AppDimensions.w12 + AppDimensions.w20,
                                                  ),
                                                  Container(
                                                    width: 3.97.w,
                                                    height: 30,
                                                    margin: EdgeInsets.only(left: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: backgroundColor,
                                                    ),
                                                    child: Center(
                                                      child: RichText(
                                                        text: TextSpan(
                                                          style: const TextStyle(
                                                            fontFamily: 'Dubai',
                                                            fontSize: 14,
                                                            color: AppColors.slate400,
                                                          ),
                                                          children: [
                                                            const TextSpan(
                                                              text: '20/',
                                                            ),
                                                            TextSpan(
                                                              text: widget.results![index].mark
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: markColor,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (isShowed) {
                                      controller.hideTooltip();
                                      hideTooltip();
                                    } else {
                                      controller.showTooltip();
                                      showTooltip();
                                    }
                                  },
                                  child: Row(
                                    children: List.generate(
                                      widget.results!.length,
                                      (index) {
                                        Color? backgroundColor;
                                        Color? markColor;
                                        if (widget.results![index].mark < 10) {
                                          backgroundColor = AppColors.red50;
                                          markColor = AppColors.red500;
                                        } else if (widget.results![index].mark <= 15) {
                                          backgroundColor = AppColors.orange502;
                                          markColor = AppColors.orange400;
                                        } else {
                                          backgroundColor = AppColors.green50;
                                          markColor = AppColors.green500;
                                        }
                                        return Container(
                                          width: 3.97.w,
                                          height: 30,
                                          margin: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: backgroundColor,
                                          ),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                style: const TextStyle(
                                                  fontFamily: 'Dubai',
                                                  fontSize: 14,
                                                  color: AppColors.slate400,
                                                ),
                                                children: [
                                                  const TextSpan(
                                                    text: '20/',
                                                  ),
                                                  TextSpan(
                                                    text: widget.results![index].mark.toString(),
                                                    style: TextStyle(
                                                      color: markColor,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ),
                  successIcon(),
                ],
              );
            } else {
              return videoPDFWidget(iconPath: 'images/PDF.svg');
            }
          },
        ),
      ),
    ).animate().fadeIn(duration: Duration(milliseconds: 800));
  }

  Padding successIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 2),
      child: SvgPicture.asset(
        'images/Success.svg',
        height: 24,
        width: 24,
        color: widget.isCompleted ? AppColors.green500 : AppColors.slate300,
      ),
    );
  }

  Widget leadingWidget({required String iconPath}) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTexts.bodyMedium(
                    text: widget.title,
                    fontSize: state.screenType == ScreenType.desktop ? 18 : 16,
                    fontColor: AppColors.slate900,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      AppTexts.bodyRegular(
                        text: widget.subtitle1,
                        fontSize: state.screenType == ScreenType.desktop ? 14 : 12,
                        fontColor: AppColors.slate500,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(
                        'images/Left.svg',
                        color: AppColors.slate500,
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      AppTexts.bodyRegular(
                        text: widget.subtitle2,
                        fontSize: state.screenType == ScreenType.desktop ? 14 : 12,
                        fontColor: AppColors.slate500,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Flex videoPDFWidget({required String iconPath}) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.center,
      direction: Axis.horizontal,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: leadingWidget(iconPath: iconPath),
        ),
        widget.isCompleted && !widget.isDaily
            ? Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTexts.bodyRegular(
                      text: 'التاريخ',
                      fontColor: AppColors.slate500,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    AppTexts.bodyMedium(
                      text: widget.completedDate!,
                      fontColor: AppColors.slate900,
                    ),
                  ],
                ))
            : SizedBox(
                width: 1,
              ),
        successIcon(),
      ],
    );
  }
}

class Result {
  final double mark;
  final String tryDate;

  const Result({
    required this.mark,
    required this.tryDate,
  });
}
