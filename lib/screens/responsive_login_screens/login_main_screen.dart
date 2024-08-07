import 'package:abwaab_practice/theme/app_colors.dart';
import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:abwaab_practice/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class LoginMainScreen extends StatefulWidget {
  const LoginMainScreen({super.key});

  @override
  State<LoginMainScreen> createState() => _LoginMainScreenState();
}

class _LoginMainScreenState extends State<LoginMainScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 700) {
          if (constraints.maxWidth >= 1125) {
            return Scaffold(
              appBar: const AppBarWidget(
                isAuthenticated: false,
              ),
              body: Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                  child: Container(
                    width: 31.67.w,
                    padding: EdgeInsets.only(
                      top: 35,
                      left: 4.18.w,
                      right: 4.18.w,
                      bottom: 60,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTexts.titleBold(
                              text: 'تسجيل دخول',
                              fontColor: AppColors.blue600,
                              fontSize: 22,
                            ),
                            Image.asset(
                              'images/Murshed_Abwaab.png',
                              height: 41,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AppTexts.bodyRegular(
                          text: 'البريد الإلكتروني',
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextField(
                          cursorColor: AppColors.blue600,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.slate900,
                          ),
                          decoration: InputDecoration(
                            fillColor: AppColors.slate50,
                            filled: true,
                            hintText: 'ادخل بريدك الإلكتروني هنا',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.slate400,
                              fontWeight: FontWeight.w400,
                            ),
                            hoverColor: AppColors.slate50,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppTexts.bodyRegular(
                          text: 'كلمة المرور',
                          fontSize: 14,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextField(
                          cursorColor: AppColors.blue600,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.slate900,
                          ),
                          decoration: InputDecoration(
                            fillColor: AppColors.slate50,
                            filled: true,
                            hintText: 'ادخل كلمة المرور هنا',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(left: AppDimensions.w12),
                              child: SvgPicture.asset(
                                'images/PasswordView.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(maxHeight: 24),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.slate400,
                              fontWeight: FontWeight.w400,
                            ),
                            hoverColor: AppColors.slate50,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.slate200,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 72,
                        ),
                        Container(
                          height: 48,
                          width: double.maxFinite,
                          foregroundDecoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.blue600,
                          ),
                          child: Center(
                            child: AppTexts.bodyMedium(
                              text: 'دخول',
                              fontColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold();
          // return  ;
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
