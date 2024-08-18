import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_texts.dart';

class DrawerFilter extends StatefulWidget {
  const DrawerFilter({
    super.key,
  });

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}

class _DrawerFilterState extends State<DrawerFilter> {
  int selectedIndex = 0;

  selectFilter(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponsivenessCubit, ResponsivenessState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                state.screenType == ScreenType.mobile || state.screenType == ScreenType.miniTablet
                    ? 16
                    : 32,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => selectFilter(0),
                child: filterWidget(
                  label: 'المواد المجدولة',
                  isSelected: selectedIndex == 0,
                  isMobile: state.screenType == ScreenType.mobile ||
                      state.screenType == ScreenType.miniTablet,
                ),
              ),
              SizedBox(
                width: AppDimensions.w12,
              ),
              GestureDetector(
                onTap: () => selectFilter(1),
                child: filterWidget(
                  label: 'التفاعلات خارج الجدول',
                  isSelected: selectedIndex == 1,
                  isMobile: state.screenType == ScreenType.mobile ||
                      state.screenType == ScreenType.miniTablet,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container filterWidget(
      {required String label, required bool isSelected, required bool isMobile}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isMobile ? 5 : 10,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue600 : AppColors.slate50,
        border: isSelected
            ? Border.all(
                color: AppColors.blue600,
              )
            : Border.all(
                color: AppColors.slate200,
              ),
        borderRadius: BorderRadius.circular(34),
      ),
      child: AppTexts.bodyRegular(
        text: label,
        fontColor: isSelected ? Colors.white : AppColors.slate900,
      ),
    );
  }
}
