import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/main_drawer_widget.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/material_performance_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';
import '../../widgets/appbar_widget/appbar_widget.dart';
import '../../widgets/interaction_panel_widgets/interaction_panel_widget.dart';
import '../../widgets/performance_panel_widgets/performance_panel_widget.dart';
import '../../widgets/student_info_widgets/performance_final_score_widget.dart';
import '../../widgets/student_info_widgets/slot_separator.dart';
import '../../widgets/student_info_widgets/student_info_header.dart';
import '../../widgets/student_info_widgets/student_info_slot.dart';
import '../../widgets/weekly_schedules/weekly_schedules_widget.dart';

class MorshedMainScreen extends StatefulWidget {
  const MorshedMainScreen({
    super.key,
  });

  @override
  State<MorshedMainScreen> createState() => _MorshedMainScreenState();
}

class _MorshedMainScreenState extends State<MorshedMainScreen> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            isAuthenticated: true,
          ),
          drawer: MainDrawerWidget(),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child:
                state.screenType == ScreenType.miniTablet || state.screenType == ScreenType.mobile
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: state.screenType == ScreenType.mobile ? 16 : 40,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/Android_Right.svg',
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(
                                          width: 0.8.w,
                                        ),
                                        Text(
                                          'رجوع',
                                          style: TextStyle(
                                            color: AppColors.primaryBlue,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: double.maxFinite,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(16),
                                                topLeft: Radius.circular(16),
                                              ),
                                              color: AppColors.blue600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          StudentInfoHeader(),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'تاريخ الاشتراك:',
                                            value: '12-05-2024',
                                            multipleInfo: true,
                                            infos: [
                                              StudentInfo(title: 'الأسبوع:', value: '#2'),
                                            ],
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'الشخصية:',
                                            value: 'باسم',
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'أهم المواد:',
                                            value:
                                                'الرياضيات، اللغة الإنجليزية، العلوم، مهارات الاتصال',
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'الهدف:',
                                            value: 'الحصول على العلامة الكاملة',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    PerformanceFinalScoreWidget(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const InteractionPanelWidget(),
                              SizedBox(
                                height: AppDimensions.h20,
                              ),
                              const PerformancePanelWidget(),
                              SizedBox(
                                height: AppDimensions.h20,
                              ),
                              WeeklySchedulesWidget(
                                controller: scrollController,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                                right: 70,
                                bottom: 20,
                              ),
                              child: SizedBox(
                                width: 310,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/Android_Right.svg',
                                          height: 24,
                                          width: 24,
                                        ),
                                        SizedBox(
                                          width: 0.8.w,
                                        ),
                                        Text(
                                          'رجوع',
                                          style: TextStyle(
                                            color: AppColors.primaryBlue,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 310,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: double.maxFinite,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(16),
                                                topLeft: Radius.circular(16),
                                              ),
                                              color: AppColors.blue600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          StudentInfoHeader(),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'تاريخ الاشتراك:',
                                            value: '12-05-2024',
                                            multipleInfo: true,
                                            infos: [
                                              StudentInfo(title: 'الأسبوع:', value: '#2'),
                                            ],
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'الشخصية:',
                                            value: 'باسم',
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'أهم المواد:',
                                            value:
                                                'الرياضيات، اللغة الإنجليزية، العلوم، مهارات الاتصال',
                                          ),
                                          SlotSeparator(),
                                          StudentInfoSlot(
                                            title: 'الهدف:',
                                            value: 'الحصول على العلامة الكاملة',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    PerformanceFinalScoreWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 63,
                                  left: 70,
                                  bottom: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const InteractionPanelWidget(),
                                    SizedBox(
                                      height: AppDimensions.h20,
                                    ),
                                    const PerformancePanelWidget(),
                                    SizedBox(
                                      height: AppDimensions.h20,
                                    ),
                                    WeeklySchedulesWidget(
                                      controller: scrollController,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}
