import 'package:abwaab_practice/theme/app_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme/app_colors.dart';

class SlotSeparator extends StatelessWidget {
  const SlotSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Divider(
            color: AppColors.slate200,
            thickness: 1,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
