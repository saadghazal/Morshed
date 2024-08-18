import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../widgets/appbar_widget/appbar_widget.dart';
import '../../widgets/interaction_panel_widgets/interaction_panel_widget.dart';
import '../../widgets/performance_panel_widgets/performance_panel_widget.dart';
import '../../widgets/student_info_widgets/performance_final_score_widget.dart';

import '../../widgets/student_info_widgets/student_info_widget.dart';
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
        return state.screenType == ScreenType.miniTablet || state.screenType == ScreenType.mobile
            ? Scaffold(
                appBar: AppBarWidget(
                  isAuthenticated: true,
                ),
                drawer: state.screenType == ScreenType.miniTablet ? MainDrawerWidget() : null,
                body: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
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
                                    const Text(
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
                                StudentInfoWidgetMobile(),
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
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBarWidget(isAuthenticated: true),
                drawer: MainDrawerWidget(),
                body: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Flex(
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
                                StudentInfoWidgetLarge(),
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
