import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';
import 'interaction_panel_footer.dart';
import 'latest_active_days.dart';

class InteractionPanelWidget extends StatelessWidget {
  const InteractionPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Container(
      padding: screenType == ScreenType.desktop ? EdgeInsets.all(20) : EdgeInsets.all(12),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.titleBold(
            text: 'لوحة التفاعل',
            fontSize:
                screenType == ScreenType.mobile || screenType == ScreenType.miniTablet ? 20 : 28,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Flexible(
                child: AppTexts.bodyRegular(
                  text: 'لأخر 10 أيام:',
                  fontColor: AppColors.slate400,
                  fontSize: screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                      ? 14
                      : 16,
                ),
              ),
              SizedBox(
                width: 0.6.w,
              ),
              AppTexts.bodyRegular(
                text: '2024-03-28 إلى 06-04-2024',
                fontColor: AppColors.blue600,
                fontSize: screenType == ScreenType.mobile || screenType == ScreenType.miniTablet
                    ? 14
                    : 16,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const InteractionPanelFooter(),
          const SizedBox(
            height: 20,
          ),
          const LatestActiveDays(),
        ],
      ),
    );
  }
}
