import 'dart:io';

import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_texts.dart';

class MaterialsFilterWidget extends StatefulWidget {
  const MaterialsFilterWidget({super.key});

  @override
  State<MaterialsFilterWidget> createState() => _MaterialsFilterWidgetState();
}

class _MaterialsFilterWidgetState extends State<MaterialsFilterWidget> {
  ScrollController scrollController = ScrollController();
  bool backEnabled = false;
  bool forwardEnabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset <= scrollController.position.minScrollExtent) {
        disableBackward();
      } else if (scrollController.offset > scrollController.position.minScrollExtent &&
          scrollController.offset < scrollController.position.maxScrollExtent) {
        enableBackward();
        enableForward();
      } else {
        disableForward();
      }
    });
  }

  disableBackward() {
    setState(() {
      backEnabled = false;
    });
  }

  enableBackward() {
    setState(() {
      backEnabled = true;
    });
  }

  enableForward() {
    setState(() {
      forwardEnabled = true;
    });
  }

  disableForward() {
    setState(() {
      forwardEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return SizedBox(
          width: double.maxFinite,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              // clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: state.screenType == ScreenType.miniTablet ||
                          state.screenType == ScreenType.mobile
                      ? 60
                      : 65,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    // clipBehavior: Clip.none,
                    padding: EdgeInsets.only(
                      left: 48,
                      right: 48,
                      bottom: state.screenType == ScreenType.miniTablet ||
                              state.screenType == ScreenType.mobile
                          ? 10
                          : 12,
                      top: state.screenType == ScreenType.miniTablet ||
                              state.screenType == ScreenType.mobile
                          ? 10
                          : 12,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 44,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.blue600,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'images/all_materials_icon.svg',
                              height: state.screenType == ScreenType.miniTablet ||
                                      state.screenType == ScreenType.mobile
                                  ? 24
                                  : 28,
                              width: state.screenType == ScreenType.miniTablet ||
                                      state.screenType == ScreenType.mobile
                                  ? 24
                                  : 28,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: AppTexts.bodyRegular(
                                text: 'جميع المواد',
                                fontColor: AppColors.slate900,
                                fontSize: state.screenType == ScreenType.miniTablet ||
                                        state.screenType == ScreenType.mobile
                                    ? 14
                                    : 16,
                              ),
                            ),
                          ],
                        ),
                      ).animate(
                        effects: [
                          FadeEffect(duration: Duration(milliseconds: 1000), begin: 0, end: 1),
                        ],
                        delay: Duration(milliseconds: 200),
                      );
                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 48),
                    itemCount: 15,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: InkWell(
                      onTap: backEnabled
                          ? () {
                              scrollController.animateTo(
                                scrollController.offset - 300,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                              );
                            }
                          : null,
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 8,
                              spreadRadius: 12,
                              offset: Offset(
                                -7,
                                0,
                              ),
                            ),
                          ],
                        ),
                        child: Opacity(
                          opacity: backEnabled ? 1 : 0.5,
                          child: SvgPicture.asset(
                            'images/forward_courses_list.svg',
                            height: state.screenType == ScreenType.miniTablet ||
                                    state.screenType == ScreenType.mobile
                                ? 35
                                : 40,
                            width: state.screenType == ScreenType.miniTablet ||
                                    state.screenType == ScreenType.mobile
                                ? 35
                                : 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: InkWell(
                    onTap: forwardEnabled
                        ? () {
                            scrollController.animateTo(
                              scrollController.offset + 300,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          }
                        : null,
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 8,
                            spreadRadius: 12,
                            offset: Offset(
                              -7,
                              0,
                            ),
                          ),
                        ],
                      ),
                      child: Opacity(
                        opacity: forwardEnabled ? 1 : 0.5,
                        child: SvgPicture.asset(
                          'images/forward_courses_list.svg',
                          height: state.screenType == ScreenType.miniTablet ||
                                  state.screenType == ScreenType.mobile
                              ? 35
                              : 40,
                          width: state.screenType == ScreenType.miniTablet ||
                                  state.screenType == ScreenType.mobile
                              ? 35
                              : 40,
                        ),
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
