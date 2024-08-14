import 'package:abwaab_practice/blox/drawer_cubit/drawer_cubit.dart';
import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';
import 'drawer_filter.dart';
import 'material_subject_pdf_video_widget.dart';

class MaterialPerformanceDrawer extends StatefulWidget {
  const MaterialPerformanceDrawer({super.key});

  @override
  State<MaterialPerformanceDrawer> createState() => _MaterialPerformanceDrawerState();
}

class _MaterialPerformanceDrawerState extends State<MaterialPerformanceDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerHeader(),
        const SizedBox(
          height: 32,
        ),
        Container(
          height: 1,
          width: double.maxFinite,
          color: AppColors.slate300,
        ),
        const SizedBox(
          height: 24,
        ),
        const DrawerFilter(),
        const SizedBox(
          height: 32,
        ),
        MaterialSubjectPdfVideoWidget(),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        if (state.screenType == ScreenType.desktop ||
            state.screenType == ScreenType.largeTablet ||
            state.screenType == ScreenType.smallTablet) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<DrawerCubit>().closeDrawer(context: context);
                      },
                      child: Ink(
                        child: SvgPicture.asset(
                          'images/Close.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    AppTexts.bodyRegular(
                      text: 'تفاصيل الأداء للمادة',
                      fontColor: AppColors.slate900,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/maths.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimensions.w12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bodyMedium(
                          text: 'الرياضيات',
                          fontColor: AppColors.slate900,
                          fontSize: 28,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            AppTexts.bodyMedium(
                              text: 'الاسبوع 04 :',
                              fontColor: AppColors.slate900,
                            ),
                            SizedBox(
                              width: 0.5.w,
                            ),
                            AppTexts.bodyRegular(
                              text: 'من 28-3-2024 إلى 21-3-2024',
                              fontColor: AppColors.slate400,
                            ),
                          ],
                        ),
                        // Spacer(),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 125,
                      width: 125,
                      child: CircularPercentIndicator(
                        radius: 50,
                        percent: 0.55,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.primaryBlue,
                        lineWidth: 6,
                        backgroundColor: AppColors.slate200,
                        center: AppTexts.bodyRegular(
                          text: '55%',
                          fontSize: 28,
                          fontColor: AppColors.slate900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Column(
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
                    child: Ink(child: SvgPicture.asset('images/Close.svg')),
                  ),
                  SizedBox(
                    width: AppDimensions.w12,
                  ),
                  AppTexts.bodyRegular(
                    text: 'تفاصيل الأداء للمادة',
                    fontColor: AppColors.slate900,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            mobileHeaderContent(
              padding: 16,
              iconSize: 48,
            ),
          ],
        );
      },
    );
  }

  Padding mobileHeaderContent({required double padding, required double iconSize}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: iconSize,
                width: iconSize,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/maths.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              AppTexts.bodyMedium(
                text: 'الرياضيات',
                fontColor: AppColors.slate900,
                fontSize: 20,
              ),
              Spacer(),
              SizedBox(
                height: 48,
                width: 48,
                child: CircularPercentIndicator(
                  radius: 23,
                  percent: 0.55,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.primaryBlue,
                  lineWidth: 3,
                  backgroundColor: AppColors.slate200,
                  center: AppTexts.bodyRegular(
                    text: '55%',
                    fontSize: 14,
                    fontColor: AppColors.slate900,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              AppTexts.bodyMedium(
                text: 'الاسبوع 04 :',
                fontColor: AppColors.slate900,
              ),
              SizedBox(
                width: 0.5.w,
              ),
              AppTexts.bodyRegular(
                text: 'من 28-3-2024 إلى 21-3-2024',
                fontColor: AppColors.slate400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
