import 'dart:io';

import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({required this.isAuthenticated, super.key});

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: state.screenType == ScreenType.miniTablet
                  ? 40
                  : state.screenType == ScreenType.mobile
                      ? 16
                      : 70,
              vertical: 12,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: AppColors.slate200,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isAuthenticated
                    ? Container(
                        width: state.screenType == ScreenType.miniTablet
                            ? 250
                            : state.screenType == ScreenType.mobile
                                ? 200
                                : 310,
                        height: 56,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.slate200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 9),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: state.screenType == ScreenType.miniTablet
                                        ? 30
                                        : state.screenType == ScreenType.mobile
                                            ? 25
                                            : 40,
                                    width: state.screenType == ScreenType.miniTablet
                                        ? 30
                                        : state.screenType == ScreenType.mobile
                                            ? 25
                                            : 40,
                                    decoration: const BoxDecoration(
                                      color: AppColors.purple400,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Mohammed Ghazal',
                                    style: TextStyle(
                                      fontSize: state.screenType == ScreenType.mobile ? 14 : 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: SvgPicture.asset(
                                'images/Down.svg',
                                height: state.screenType == ScreenType.mobile ? 20 : 24,
                                width: state.screenType == ScreenType.mobile ? 20 : 24,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                Expanded(
                  child: Container(),
                ),
                Image.asset(
                  'assets/images/Abwaab_Logo2.png',
                  width: state.screenType == ScreenType.mobile ? 120 : 148,
                  height: 39,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
