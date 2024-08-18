import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class MaterialSubjectExamWidget extends StatefulWidget {
  const MaterialSubjectExamWidget({super.key});

  @override
  State<MaterialSubjectExamWidget> createState() => _MaterialSubjectExamWidgetState();
}

class _MaterialSubjectExamWidgetState extends State<MaterialSubjectExamWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.slate200),
          ),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    leadingIcon(40),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTexts.bodyMedium(
                            text: 'المجموعات والفترات 1',
                            fontSize: 18,
                            fontColor: AppColors.slate900,
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              AppTexts.bodyRegular(
                                text: 'المتباينات الخطية',
                                fontSize: 14,
                                fontColor: AppColors.slate500,
                              ),
                              SvgPicture.asset(
                                'images/Left.svg',
                                height: 16,
                                width: 16,
                                color: AppColors.slate500,
                              ),
                              AppTexts.bodyRegular(
                                text: 'المجموعات والفترات',
                                fontSize: 14,
                                fontColor: AppColors.slate500,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexts.bodyRegular(
                          text: 'عدد المحاولات',
                          fontSize: 14,
                          fontColor: AppColors.slate500,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        AppTexts.bodyMedium(
                          text: '5',
                          fontColor: AppColors.slate900,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppTexts.bodyRegular(
                          text: 'النتيجة',
                          fontSize: 14,
                          fontColor: AppColors.slate500,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 57,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.orange502,
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: "Dubai",
                                      fontSize: 16,
                                      color: AppColors.orange400,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '20/',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.slate400,
                                        ),
                                      ),
                                      TextSpan(text: '13'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 57,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.green50,
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: "Dubai",
                                      fontSize: 16,
                                      color: AppColors.green500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '20/',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.slate400,
                                        ),
                                      ),
                                      TextSpan(text: '17'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 57,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.red50,
                              ),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: "Dubai",
                                      fontSize: 16,
                                      color: AppColors.red500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '20/',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.slate400,
                                        ),
                                      ),
                                      TextSpan(text: '7'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              successWidget(24),
            ],
          ),
        );
      },
    );
  }

  SvgPicture leadingIcon(double size) {
    return SvgPicture.asset(
      'images/Test.svg',
      height: size,
      width: size,
    );
  }

  SvgPicture successWidget(double size) {
    return SvgPicture.asset(
      'images/Success.svg',
      height: size,
      width: size,
      color: AppColors.green500,
    );
  }
}
