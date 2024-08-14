import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_colors.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaterialSubjectPdfVideoWidget extends StatelessWidget {
  const MaterialSubjectPdfVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        if (state.screenType == ScreenType.desktop || state.screenType == ScreenType.largeTablet) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.slate200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      leadingIcon(40),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTexts.bodyMedium(
                              text: 'المجموعات والفترات 1',
                              fontSize: 18,
                              fontColor: AppColors.slate900,
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                AppTexts.bodyRegular(
                                  text: 'المتباينات الخطية',
                                  fontSize: 14,
                                  fontColor: AppColors.slate500,
                                ),
                                SvgPicture.asset(
                                  'images/Left.svg',
                                  height: 16,
                                  width: 16,
                                  color: AppColors.slate500,
                                ),
                                AppTexts.bodyRegular(
                                  text: 'المجموعات والفترات',
                                  fontSize: 14,
                                  fontColor: AppColors.slate500,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTexts.bodyRegular(
                      text: 'التاريخ',
                      fontSize: 14,
                      fontColor: AppColors.slate500,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppTexts.bodyMedium(
                      text: '2024-03-19',
                      fontColor: AppColors.slate900,
                    ),
                  ],
                ),
                Spacer(),
                successWidget(24),
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.slate200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        if (state.screenType == ScreenType.mobile) {
                          return leadingIcon(28);
                        } else if (state.screenType == ScreenType.miniTablet) {
                          return leadingIcon(34);
                        } else {
                          return leadingIcon(40);
                        }
                      }),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Builder(
                          builder: (context) {
                            if (state.screenType == ScreenType.mobile) {
                              return contentWidget(titleSize: 16);
                            } else if (state.screenType == ScreenType.miniTablet) {
                              return contentWidget(titleSize: 16);
                            } else {
                              return contentWidget(titleSize: 18);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (state.screenType == ScreenType.mobile) {
                      return successWidget(18);
                    } else if (state.screenType == ScreenType.miniTablet) {
                      return successWidget(20);
                    } else {
                      return successWidget(24);
                    }
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Column contentWidget({
    required double titleSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.bodyMedium(
          text: 'المجموعات والفترات 1',
          fontSize: titleSize,
          fontColor: AppColors.slate900,
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            AppTexts.bodyRegular(
              text: 'المتباينات الخطية',
              fontSize: 14,
              fontColor: AppColors.slate500,
            ),
            SvgPicture.asset(
              'images/Left.svg',
              height: 16,
              width: 16,
              color: AppColors.slate500,
            ),
            Flexible(
              child: AppTexts.bodyRegular(
                text: 'المجموعات والفترات',
                fontSize: 14,
                fontColor: AppColors.slate500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AppTexts.bodyRegular(
              text: 'التاريخ',
              fontSize: 14,
              fontColor: AppColors.slate500,
            ),
            SizedBox(
              width: 10,
            ),
            AppTexts.bodyMedium(
              text: '2024-03-19',
              fontColor: AppColors.slate900,
            ),
          ],
        ),
      ],
    );
  }

  SvgPicture leadingIcon(double size) {
    return SvgPicture.asset(
      'images/play_video.svg',
      height: size,
      width: size,
    );
  }

  SvgPicture successWidget(double size) {
    return SvgPicture.asset(
      'images/Success.svg',
      height: size,
      width: size,
      color: AppColors.green500,
    );
  }
}

//
// SuperTooltip(
// controller: controller,
// showBarrier: false,
// hasShadow: false,
// borderColor: Colors.transparent,
// minimumOutsideMargin: 0,
// backgroundColor: Colors.transparent,
// popupDirection: TooltipDirection.up,
// content: IntrinsicHeight(
// child: IntrinsicWidth(
// child: Container(
// // width: 200,
// padding:
// EdgeInsets.only(top: 16, bottom: 16, left: 20, right: 9),
// decoration: BoxDecoration(
// color: Colors.white,
// border: Border.all(
// color: AppColors.slate200,
// ),
// borderRadius: BorderRadius.circular(16),
// boxShadow: const [
// BoxShadow(
// color: Colors.black12,
// spreadRadius: 2,
// blurRadius: 10,
// offset: Offset(0, 6),
// ),
// ],
// ),
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: List.generate(
// widget.results!.length,
// (index) {
// Color? backgroundColor;
// Color? markColor;
// if (widget.results![index].mark < 10) {
// backgroundColor = AppColors.red50;
// markColor = AppColors.red500;
// } else if (widget.results![index].mark <= 15) {
// backgroundColor = AppColors.orange502;
// markColor = AppColors.orange400;
// } else {
// backgroundColor = AppColors.green50;
// markColor = AppColors.green500;
// }
// return Padding(
// padding: EdgeInsets.only(
// bottom: index != widget.results!.length - 1 ? 8 : 0,
// ),
// child: Row(
// children: [
// AppTexts.bodyMedium(
// text: widget.results![index].tryDate,
// fontColor: AppColors.slate900,
// ),
// SizedBox(
// width: AppDimensions.w12 + AppDimensions.w20,
// ),
// Container(
// width: 3.97.w,
// height: 30,
// margin: EdgeInsets.only(left: 8),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// color: backgroundColor,
// ),
// child: Center(
// child: RichText(
// text: TextSpan(
// style: const TextStyle(
// fontFamily: 'Dubai',
// fontSize: 14,
// color: AppColors.slate400,
// ),
// children: [
// const TextSpan(
// text: '20/',
// ),
// TextSpan(
// text: widget.results![index].mark
//     .toString(),
// style: TextStyle(
// color: markColor,
// fontSize: 16,
// fontWeight: FontWeight.w500,
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ],
// ),
// );
// },
// ),
// ),
// ),
// ),
// ),
