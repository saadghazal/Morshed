import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';
import 'chart_widget.dart';
import 'general_performance_results_widget.dart';
import 'materials_filter_widget.dart';

class PerformancePanelWidget extends StatefulWidget {
  const PerformancePanelWidget({super.key});

  @override
  State<PerformancePanelWidget> createState() => _PerformancePanelWidgetState();
}

class _PerformancePanelWidgetState extends State<PerformancePanelWidget> {
  int selectedIndex = 0;
  select(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Container(
      padding: screenType == ScreenType.desktop ? EdgeInsets.all(20) : EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.titleBold(
            text: 'لوحة الأداء',
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              AppTexts.bodyRegular(
                text: 'لأخر 10 أيام:',
                fontColor: AppColors.slate400,
              ),
              SizedBox(
                width: 0.6.w,
              ),
              AppTexts.bodyRegular(
                text: '2024-03-28 إلى 06-04-2024',
                fontColor: AppColors.blue600,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          const MaterialsFilterWidget(),
          const SizedBox(
            height: 20,
          ),
          GeneralPerformanceResultsWidget(
            select: select,
            selectedIndex: selectedIndex,
          ),
          const SizedBox(
            height: 38,
          ),
          AppTexts.titleMedium(
            text: 'لوحة مقارنة الأداء الإسبوعية',
            fontSize: 20,
            fontColor: AppColors.slate900,
          ),
          const SizedBox(
            height: 38,
          ),
          ChartWidget(
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}
