import 'package:abwaab_practice/blox/responsiveness_cubit/responsiveness_cubit.dart';
import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:abwaab_practice/theme/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class StudentInfoSlot extends StatelessWidget {
  StudentInfoSlot({
    required this.title,
    required this.value,
    this.infos,
    this.multipleInfo = false,
    super.key,
  });
  final String title;
  final String value;
  List<StudentInfo>? infos;
  final bool multipleInfo;

  @override
  Widget build(BuildContext context) {
    var screenType = context.watch<ResponsivenessCubit>().state.screenType;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ink(
                width: 100,
                child: AppTexts.bodyRegular(
                  text: title,
                  fontColor: AppColors.slate400,
                  fontSize: 16,
                ),
              ),
              Flexible(
                child: AppTexts.bodyMedium(
                  text: value,
                  textOverflow: TextOverflow.visible,
                  fontColor: AppColors.slate900,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          if (multipleInfo)
            ...infos!.map((element) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ink(
                    width: 100,
                    child: AppTexts.bodyRegular(
                      text: element.title,
                      fontColor: AppColors.slate400,
                      fontSize: 16,
                    ),
                  ),
                  Flexible(
                    child: AppTexts.bodyMedium(
                      text: element.value,
                      textOverflow: TextOverflow.visible,
                      fontColor: AppColors.slate900,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            }).toList()
        ],
      ),
    );
  }
}

class StudentInfo {
  String title;
  String value;

  StudentInfo({
    required this.title,
    required this.value,
  });
}
