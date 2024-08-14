import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class PerformanceFinalScoreWidget extends StatelessWidget {
  const PerformanceFinalScoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Container(
      width: screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
          ? double.maxFinite
          : 310,
      // width: screenType == ScreenType.desktop ? 21.52.w : 20.w,
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.blue600),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(-5, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(5, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppTexts.titleBold(
            text: 'تحسن واضح',
            fontSize: screenType == ScreenType.desktop ? 22 : 18,
            fontColor: AppColors.blue600,
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: screenType == ScreenType.desktop ? 18 : 16,
                color: AppColors.slate900,
                fontWeight: FontWeight.w500,
                fontFamily: 'Dubai',
              ),
              children: [
                TextSpan(
                  text: 'لقد تحسن أداء الطالب بنسبة',
                ),
                TextSpan(
                  text: ' 20% ',
                  style: TextStyle(
                    color: AppColors.blue600,
                  ),
                ),
                TextSpan(text: 'منذ بداية الفصل'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
