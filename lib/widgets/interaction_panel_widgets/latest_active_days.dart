import 'package:abwaab_practice/blox/drawer_cubit/drawer_cubit.dart';
import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../theme/app_colors.dart';

class LatestActiveDays extends StatelessWidget {
  const LatestActiveDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) {
              DateTime dateTime = DateTime.now().copyWith(
                day: DateTime.now().day - index,
              );

              return ActivityDayWidget(
                dateTime: dateTime,
                index: index,
                isToday: dateTime.day == DateTime.now().day,
              ).animate(
                effects: [
                  FadeEffect(
                    duration: Duration(milliseconds: 500),
                  ),
                ],
                delay: Duration(milliseconds: 200),
              );
            },
          ).reversed.toList(),
        ),
      ),
    );
  }
}

class ActivityDayWidget extends StatefulWidget {
  const ActivityDayWidget({
    super.key,
    required this.dateTime,
    required this.index,
    this.isToday = false,
  });

  final DateTime dateTime;
  final int index;
  final bool isToday;

  @override
  State<ActivityDayWidget> createState() => _ActivityDayWidgetState();
}

class _ActivityDayWidgetState extends State<ActivityDayWidget> {
  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return InkWell(
      onTap: () {
        context.read<DrawerCubit>().openDrawer(
              context: context,
              drawerType: DrawerType.daily,
            );
      },
      child: Container(
        height: 88,
        width: 84,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.only(
          top: screenType == ScreenType.desktop ? 12 : 10,
          bottom: screenType == ScreenType.desktop ? 6 : 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: widget.isToday ? Border.all(color: AppColors.blue400, width: 2) : null,
          color: widget.index % 2 == 0 ? AppColors.blue50 : AppColors.slate50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'images/Success.svg',
              color: widget.index % 2 == 0 ? AppColors.primaryBlue : AppColors.slate300,
            ),
            AppTexts.bodyRegular(
              text: DateFormat.E().format(widget.dateTime),
              fontSize: 16,
              fontColor: AppColors.slate900,
            ),
            AppTexts.bodyRegular(
              text:
                  '${DateFormat.d().format(widget.dateTime).padLeft(2, '0')}-${DateFormat.M().format(widget.dateTime).padLeft(2, '0')}',
              fontSize: 14,
              fontColor: AppColors.slate400,
            ),
          ],
        ),
      ),
    );

    // return OverlayPortal(
    //   controller: controller,
    //   overlayChildBuilder: (BuildContext context) {
    //     return Positioned(
    //       top: 230,
    //       left: 108,
    //       child: Container(
    //         // height: 32,
    //         // width: 47,
    //         padding: EdgeInsets.only(
    //           top: 3,
    //           bottom: 7,
    //           left: AppDimensions.w12,
    //           right: AppDimensions.w12,
    //         ),
    //         decoration: const BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage('assets/images/Union.png'),
    //             // fit: BoxFit.cover,
    //           ),
    //         ),
    //         alignment: Alignment.topCenter,
    //         child: AppTexts.bodyRegular(
    //           text: 'اليوم',
    //           fontColor: Colors.white,
    //           fontSize: 14,
    //         ),
    //       ),
    //     );
    //   },
    //   child:
  }
}
