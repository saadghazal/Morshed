import 'package:abwaab_practice/blox/drawer_cubit/drawer_cubit.dart';
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
import 'material_subject_widget.dart';

class MaterialPerformanceDrawer extends StatefulWidget {
  const MaterialPerformanceDrawer({super.key});

  @override
  State<MaterialPerformanceDrawer> createState() => _MaterialPerformanceDrawerState();
}

class _MaterialPerformanceDrawerState extends State<MaterialPerformanceDrawer> {
  bool isShowed = false;
  late Offset tapOffset;
  List<Result> results = [
    Result(
      mark: 13,
      tryDate: '2024-03-20',
    ),
    Result(
      mark: 17,
      tryDate: '2024-03-19',
    ),
    Result(
      mark: 7,
      tryDate: '2024-03-15',
    ),
  ];
  showTooltip() {
    isShowed = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            drawerHeader(context: context),
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
            const MaterialSubjectWidget(
              title: 'المجموعات والفترات 1',
              completedDate: '2024-03-19',
              isCompleted: true,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'المجموعات والفترات 2',
              isCompleted: true,
              completedDate: '2024-03-19',
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'أتدرب وأحل مسائل 1',
              isCompleted: false,
              completedDate: '',
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialSubjectWidget(
              title: 'امتحان الدرس - المجموعات والفترات 1',
              isCompleted: true,
              subjectType: SubjectType.exam,
              numberOfTries: 5,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
              onTap: () {},
              results: results,
              completedDate: '',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'امتحان الدرس - المجموعات والفترات 2',
              isCompleted: true,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
              subjectType: SubjectType.exam,
              numberOfTries: 1,
              results: [
                Result(
                  mark: 17,
                  tryDate: '2024-03-19',
                ),
              ],
              completedDate: '',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'امتحان الدرس - المجموعات والفترات 2',
              isCompleted: false,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'المجموعات والفترات',
              subjectType: SubjectType.exam,
              numberOfTries: 1,
              numberOfSolvedQuestions: 10,
              completedDate: '',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'مفهوم المتباينات المركبة 1',
              isCompleted: false,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'حل المتباينات المركبة',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'مهارات التفكير العليا',
              subjectType: SubjectType.file,
              isCompleted: false,
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'حل المتباينات المركبة',
            ),
            const SizedBox(
              height: 12,
            ),
            const MaterialSubjectWidget(
              title: 'حل المتباينات المركبة',
              subjectType: SubjectType.file,
              isCompleted: true,
              completedDate: '2024-03-19',
              subtitle1: 'المتباينات الخطية',
              subtitle2: 'حل المتباينات المركبة',
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
        isShowed
            ? Positioned(
                top: tapOffset.dy,
                left: tapOffset.dx,
                child: Container(
                  width: AppDimensions.w20 * 10 + 3,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.slate200,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: List.generate(
                      results.length,
                      (index) {
                        Color? backgroundColor;
                        Color? markColor;
                        if (results[index].mark < 10) {
                          backgroundColor = AppColors.red50;
                          markColor = AppColors.red500;
                        } else if (results[index].mark <= 15) {
                          backgroundColor = AppColors.orange502;
                          markColor = AppColors.orange400;
                        } else {
                          backgroundColor = AppColors.green50;
                          markColor = AppColors.green500;
                        }
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index != results.length - 1 ? 8 : 0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 3.97.w,
                                height: 30,
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: backgroundColor,
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'Dubai',
                                        fontSize: 14,
                                        color: AppColors.slate400,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: '20/',
                                        ),
                                        TextSpan(
                                          text: results![index].mark.toString(),
                                          style: TextStyle(
                                            color: markColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              AppTexts.bodyMedium(
                                text: results[index].tryDate,
                                fontColor: AppColors.slate900,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Column drawerHeader({required BuildContext context}) {
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.w12 + AppDimensions.w20),
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
}
