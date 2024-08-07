import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class StudentInfoHeader extends StatelessWidget {
  const StudentInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black45,
              image: DecorationImage(
                image: AssetImage('assets/images/Dawood.png'),
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTexts.bodyMedium(
                text: 'داوود خالد',
                fontSize: 18,
              ),
              const SizedBox(
                height: 2,
              ),
              AppTexts.bodyRegular(
                text: 'التاسع - الأردن',
                fontColor: AppColors.primaryBlue,
                fontSize: 16,
              ),
            ],
          )
        ],
      ),
    );
  }
}
