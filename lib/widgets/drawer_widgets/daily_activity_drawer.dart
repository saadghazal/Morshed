import 'package:abwaab_practice/widgets/drawer_widgets/drawer_filter.dart';
import 'package:abwaab_practice/widgets/drawer_widgets/material_subject_pdf_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blox/drawer_cubit/drawer_cubit.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';

class DailyActivityDrawer extends StatefulWidget {
  const DailyActivityDrawer({super.key});

  @override
  State<DailyActivityDrawer> createState() => _DailyActivityDrawerState();
}

class _DailyActivityDrawerState extends State<DailyActivityDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 30,
            right: AppDimensions.w20,
            left: AppDimensions.w20,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<DrawerCubit>().closeDrawer(context: context);
                },
                child: Ink(
                  child: SvgPicture.asset('images/Close.svg'),
                ),
              ),
              SizedBox(
                width: AppDimensions.w12,
              ),
              AppTexts.bodyRegular(
                text: 'تفاصيل الأداء اليومي',
                fontColor: AppColors.slate900,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.w12 + AppDimensions.w20,
          ),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Dubai',
                fontSize: 28,
                color: AppColors.slate900,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(text: 'الأحد: '),
                TextSpan(
                  text: '2024-03-31',
                  style: TextStyle(
                    color: AppColors.blue600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Container(
          height: 1,
          color: AppColors.slate300,
        ),
        const SizedBox(
          height: 24,
        ),
        const DrawerFilter(),
        const SizedBox(
          height: 32,
        ),
        courseHeader(
          courseIcon: 'images/maths.png',
          courseName: 'الرياضيات',
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 36,
        ),
        courseHeader(
          courseIcon: 'images/arabic.png',
          courseName: 'مهارات الاتصال',
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Padding courseHeader({
    required String courseIcon,
    required String courseName,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.w12 + AppDimensions.w20,
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(courseIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: AppDimensions.w12,
          ),
          AppTexts.bodyMedium(
            text: courseName,
            fontSize: 22,
            fontColor: AppColors.slate900,
          ),
        ],
      ),
    );
  }
}
