import 'dart:io';

import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class InteractionPanelFooter extends StatelessWidget {
  const InteractionPanelFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        if (state.screenType == ScreenType.desktop) {
          return buildRowOrColumn(
            isColumn: false,
            isDesktop: true,
            fontSize: 18,
            dateSize: 22,
            iconSize: 32,
          );
        } else if (state.screenType == ScreenType.largeTablet) {
          print("Large");
          return buildRowOrColumn(
            isColumn: false,
            iconSize: 28,
            fontSize: 16,
            dateSize: 20,
          );
        } else if (state.screenType == ScreenType.smallTablet) {
          print("Small");
          return buildRowOrColumn(
            isColumn: true,
            fontSize: 16,
            dateSize: 20,
            isInternalColumn: false,
            iconSize: 28,
          );
        } else {
          return buildRowOrColumn(
            isColumn: true,
            iconSize: 26,
            fontSize: 16,
            dateSize: 18,
          );
        }
      },
    );
  }

  Widget buildRowOrColumn({
    required bool isColumn,
    required double fontSize,
    required double dateSize,
    required double iconSize,
    bool isDesktop = false,
    bool isInternalColumn = false,
  }) {
    return isColumn
        ? SizedBox(
            height: 200,
            child: Column(
              children: [
                contentWidget(
                  iconSize,
                  fontSize,
                  isDesktop,
                  dateSize,
                  'images/calender.svg',
                  'عدد ايام التفاعل',
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: '10/ ',
                            style: TextStyle(
                              fontSize: fontSize,
                              color: AppColors.slate400,
                            ),
                          ),
                          TextSpan(
                            text: '5',
                            style: TextStyle(
                              fontSize: dateSize,
                              color: AppColors.blue600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                contentWidget(
                  isInternalColumn: isInternalColumn,
                  iconSize,
                  fontSize,
                  isDesktop,
                  dateSize,
                  'images/profile_icon.svg',
                  'تاريخ أخر تفاعل',
                  AppTexts.bodyMedium(
                    text: '2024-04-04',
                    fontColor: AppColors.blue600,
                    fontSize: dateSize,
                  ),
                ),
              ],
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              contentWidget(
                iconSize,
                fontSize,
                isDesktop,
                dateSize,
                'images/calender.svg',
                'عدد ايام التفاعل',
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: '10/ ',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: AppColors.slate400,
                          ),
                        ),
                        TextSpan(
                          text: '5',
                          style: TextStyle(
                            fontSize: dateSize,
                            color: AppColors.blue600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              contentWidget(
                isInternalColumn: isInternalColumn,
                iconSize,
                fontSize,
                isDesktop,
                dateSize,
                'images/profile_icon.svg',
                'تاريخ أخر تفاعل',
                AppTexts.bodyMedium(
                  text: '2024-04-04',
                  fontColor: AppColors.blue600,
                  fontSize: dateSize,
                ),
              ),
            ],
          );
  }

  Widget contentWidget(
    double iconSize,
    double fontSize,
    bool isDesktop,
    double dateSize,
    String iconPath,
    String label,
    Widget trailing, {
    bool isInternalColumn = false,
  }) {
    return isInternalColumn
        ? Expanded(
            child: Container(
              height: 83,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.slate50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        height: iconSize,
                        width: iconSize,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      AppTexts.bodyMedium(
                        text: label,
                        fontColor: AppColors.slate900,
                        fontSize: fontSize,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  trailing,
                ],
              ),
            ),
          )
        : Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.slate50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        height: iconSize,
                        width: iconSize,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      AppTexts.bodyMedium(
                        text: label,
                        fontColor: AppColors.slate900,
                        fontSize: fontSize,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: isDesktop ? AppDimensions.w20 + AppDimensions.w12 : AppDimensions.w12,
                    ),
                    child: trailing,
                  )
                ],
              ),
            ),
          );
  }
}
